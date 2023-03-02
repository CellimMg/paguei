import 'package:flutter/material.dart';
import 'package:melembra/presenter/commom/base_screen/base_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
