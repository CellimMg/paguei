import 'package:flutter/material.dart';
import 'package:melembra/presenter/commom/base_screen/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:melembra/presenter/commom/base_screen/widgets/custom_drawer/custom_drawer.dart';


class BaseScreen extends StatelessWidget {

  final String? pageTitle;

  const BaseScreen({Key? key, this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(),
      body: const Center(
        child: Text('Homeaa'),
      ),
    );
  }
}
