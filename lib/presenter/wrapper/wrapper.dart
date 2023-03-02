import 'package:flutter/material.dart';
import 'package:melembra/domain/usecases/authentication.dart';
import 'package:melembra/utils/providers.dart';

import '../authentication/page/authentication_page.dart';
import '../home/page/home.dart';

class Wrapper extends StatelessWidget {
  final authentication = getIt<Authentication>();

  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authentication.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return const Home();
        } else {
          return AuthenticationPage();
        }
      },
    );
  }
}
