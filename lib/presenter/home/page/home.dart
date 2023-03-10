import 'package:flutter/material.dart';
import 'package:melembra/presenter/commom/base_screen/base_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );


  }

  void setupAnimation() {
    _animation = Tween<double>(
      begin: - (MediaQuery.of(context).size.height + 500),
      end: 0,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    setupAnimation();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _){
            return Stack(
              children: [
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  top: _animation.value,
                  child: const BaseScreen(
                    body: Center(
                      child: Text('Home'),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
