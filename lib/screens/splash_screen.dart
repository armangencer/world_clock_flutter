import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:world_clock_flutter/constants/constants.dart';
import 'package:world_clock_flutter/theme/color_palette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/homePage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.darkBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(dopLogo),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/homePage');
                },
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
