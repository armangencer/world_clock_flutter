import 'package:flutter/material.dart';
import 'package:world_clock_flutter/constants/constants.dart';
import 'package:world_clock_flutter/theme/color_palette.dart';
import 'package:world_clock_flutter/theme/theme.dart';
import '../components/country_list_view.dart';
import '../components/search_button.dart';
import '../components/theme_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeIsDark.isDark,
      builder: (context, value, child) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: 199,
                width: 375,
                decoration: BoxDecoration(
                  color: value == false
                      ? ColorPalette.lightTextBackgroundColor
                      : ColorPalette.dartTextBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 250,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 33, vertical: 69),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Günaydın Arman!',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: value == false
                                  ? ColorPalette.lightTextColor
                                  : ColorPalette.darkTextColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Text(
                            '09:54',
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: value == false
                                  ? ColorPalette.lightTextColor
                                  : ColorPalette.darkTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Text(
                            '8 Haziran Çarşamba',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: value == false
                                    ? ColorPalette.lightTextColor
                                    : ColorPalette.darkTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SearchButton(),
                    CountryList(),
                  ],
                ),
              ),
              const Positioned(
                left: 301,
                top: 66,
                child: ThemeButton(),
              ),
            ],
          ),
        );
      },
    );
  }
}
