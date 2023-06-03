import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_clock_flutter/screens/home_screen.dart';
import 'dart:ui';
import 'package:world_clock_flutter/screens/splash_screen.dart';
import 'package:world_clock_flutter/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeIsDark.isDark,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splashScreen',
          routes: {
            '/splashScreen': (context) => const SplashScreen(),
            '/homePage': (context) => const HomePage(),
          },
          theme: value == false ? ThemeData.light() : ThemeData.dark(),
          themeMode: ThemeMode.system,
          darkTheme: darkThemeData(context),
          home: const HomePage(),
        );
      },
    );
  }
}
