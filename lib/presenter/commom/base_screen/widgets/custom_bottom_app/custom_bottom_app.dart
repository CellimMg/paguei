import 'package:flutter/material.dart';

class CustomBottomApp extends StatelessWidget {
  const CustomBottomApp({Key? key}) : super(key: key);


  //a bottom bar with 3 buttons, one of them centered and with a half of his body out of the bar
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

}
