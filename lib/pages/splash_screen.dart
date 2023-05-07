import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:week13_flutter_animation/pages/second_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //управление временем анимации
  late Animation animation;
  late AnimationController _controller;

  @override
  void initState() {
    //инициализация
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this)
          ..repeat(); //бесконечная длительность анимации
    // ..forward(); //длительность цикла анимации
  }

  @override
  void dispose() {
    //освобождение части памяти, поселедний этап жизненного цикла виджета
    super.dispose();
  }

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'AbrilFatface',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpeg"),
                  fit: BoxFit.cover))),
      Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: Center(
              child: Column(children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  //скорость вращения
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/cycle.png',
                width: 320,
                height: 390,
              ),
            ),
            AnimatedTextKit(animatedTexts: [
              ColorizeAnimatedText(
                'Wonders of nature',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ]),
          ]))),
      Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    duration: const Duration(seconds: 1),
                    child: ListScreen(),
                  )),
              child: AvatarGlow(
                  endRadius: 60.0,
                  child: Material(
                      // Replace this child with your own
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        radius: 30.0,
                        child: Image.asset(
                          'assets/images/next.png',
                          height: 50,
                        ),
                      )))))
    ]));
  }
}
