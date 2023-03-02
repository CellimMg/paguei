import 'package:flutter/material.dart';
import 'package:melembra/utils/images.dart';

class CustomBottomApp extends StatelessWidget {
  const CustomBottomApp({Key? key}) : super(key: key);


  //a bottom bar with 3 buttons, one of them centered and with a half of his body out of the bar
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xffF0F0F0),
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Color(0xff3072F2),),
            onPressed: () {},
          ),
          IconButton(
            icon: const ImageIcon(AssetImage(ImagesRepository.iconBoleto), size: 18, color: Color(0xff3072F2),),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

}
