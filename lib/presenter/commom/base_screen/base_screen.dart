import 'package:flutter/material.dart';
import 'package:melembra/presenter/commom/base_screen/widgets/custom_app_bar/custom_app_bar.dart';


class BaseScreen extends StatelessWidget {

  final String? pageTitle;

  const BaseScreen({Key? key, this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Center(
          child: Text('Drawer'),
        ),
      ),
      appBar: CustomAppBar(),
      body: const Center(
        child: Text('Homeaa'),
      ),
    );
  }
}
