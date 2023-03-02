import 'package:flutter/material.dart';
import 'package:melembra/presenter/commom/base_screen/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:melembra/presenter/commom/base_screen/widgets/custom_bottom_app/custom_bottom_app.dart';
import 'package:melembra/presenter/commom/base_screen/widgets/custom_drawer/custom_drawer.dart';


class BaseScreen extends StatelessWidget {

  final String? pageTitle;
  final Widget body;

  const BaseScreen({Key? key, this.pageTitle, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Color(0xff3072F2),
        child: Icon(Icons.add),
      ),
      drawer: CustomDrawer(),
      appBar: CustomAppBar(),
      bottomNavigationBar: const CustomBottomApp(),
      body: body,
    );
  }
}
