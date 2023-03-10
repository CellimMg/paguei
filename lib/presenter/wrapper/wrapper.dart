import 'package:flutter/material.dart';
import 'package:melembra/domain/usecases/authentication.dart';
import 'package:melembra/utils/images.dart';
import 'package:melembra/utils/providers.dart';

import '../authentication/page/authentication_page.dart';
import '../home/page/home.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with TickerProviderStateMixin {
  final authentication = getIt<Authentication>();

  late AnimationController _animationControllerContainer;
  late AnimationController _animationControllerImage;

  late Animation<double> _animationContainer;
  late Animation<double> _animationImage;

  @override
  void initState() {
    super.initState();
    _animationControllerContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _animationControllerImage = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  void setupAnimation() {
    _animationContainer = Tween<double>(
      begin: 0,
      end: MediaQuery.of(context).size.height + 100,
    ).animate(_animationControllerContainer);
    _animationControllerContainer.forward();

    _animationImage = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_animationControllerImage);

    Future.delayed(const Duration(milliseconds: 500), () {
      _animationControllerImage.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    setupAnimation();

    return AnimatedBuilder(animation: _animationContainer, builder: (context, _){
      return StreamBuilder(
        stream: authentication.user,
        builder: (context, snapshot) {
          //if snapshot is waiting or animation isnt completed
          if (snapshot.connectionState == ConnectionState.waiting ||
              _animationControllerContainer.status != AnimationStatus.completed) {
            return Container(
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _animationContainer,
                      builder: (context, widget) {
                        return Positioned(
                          height: _animationContainer.value,
                          width: _animationContainer.value,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff3072F2),
                              borderRadius: BorderRadius.circular(500),
                            ),
                            height: _animationContainer.value,
                            width: _animationContainer.value,
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                        animation: _animationImage,
                        builder: (context, widget) {
                          return Opacity(
                            opacity: _animationImage.value,
                            child: Image.asset(
                              ImagesRepository.splashImage,
                            ),
                          );
                        })
                  ],
                ));
          } else if (snapshot.hasData) {
            return const Home();
          } else {
            return AuthenticationPage();
          }
        },
      );
    });
  }
}
