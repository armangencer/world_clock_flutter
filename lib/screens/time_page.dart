import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:world_clock_flutter/constants/constants.dart';
import 'package:world_clock_flutter/theme/color_palette.dart';
import 'package:world_clock_flutter/theme/theme.dart';

class TimePage extends StatelessWidget {
  final String country;
  const TimePage({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeIsDark.isDark,
      builder: (context, value, child) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: 111,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: value == false
                        ? ColorPalette.lightTextBackgroundColor
                        : ColorPalette.dartTextBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 33),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 71),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WORLD TIME',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w800,
                                color: value == false
                                    ? ColorPalette.lightTextColor
                                    : ColorPalette.darkTextColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 69,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back,
                      weight: 2,
                      color: value == false
                          ? ColorPalette.lightTextColor
                          : ColorPalette.darkTextColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 161),
                      child: Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: value == false
                              ? ColorPalette.scaffoldBackgroundColor
                              : ColorPalette.dartTextBackgroundColor,
                          borderRadius: BorderRadius.circular(14),
                          border: value == false
                              ? Border.all(
                                  width: 2, color: ColorPalette.lightTextColor)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            '00:00',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 79,
                                fontFamily: 'Montserrat',
                                color: value == false
                                    ? ColorPalette.lightTextColor
                                    : ColorPalette.darkTextColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 329),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        country,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: value == false
                                ? ColorPalette.lightTextColor
                                : ColorPalette.darkTextColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text(
                          'Çarşamba GMT +01:00',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: value == false
                                  ? ColorPalette.lightTextColor
                                  : ColorPalette.darkTextColor),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
