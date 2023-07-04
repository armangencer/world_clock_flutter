import 'dart:async';

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
    Timer(const Duration(seconds: 10), () {
      Navigator.pushNamed(context, '/homePage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.darkBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              splashImage,
            ),
            Image.asset(
              splashImage2,
            ),
            Image.asset(
              splashImage3,
            ),
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homePage');
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
