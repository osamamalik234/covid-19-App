import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:sample_project/covid_app/world_test_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => WorldTestScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _animationController,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image(
                    image: AssetImage('asset/virus.png'),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _animationController.value * 2.0 * pi,
                    child: child,
                  );
                }),
            SizedBox(
              height: 20,
            ),
            Text(
              "Covid-19\nTraking App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
