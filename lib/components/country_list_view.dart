import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_clock_flutter/screens/time_page.dart';
import '../screens/home_screen.dart';
import '../theme/color_palette.dart';
import '../theme/theme.dart';
import 'search_button.dart';

class CountryList extends StatefulWidget {
  const CountryList({
    super.key,
  });

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ValueListenableBuilder(
        valueListenable: ThemeIsDark.isDark,
        builder: (context, value, child) {
          return SizedBox(
            height: 485,
            child: ListView.builder(
              itemCount: filteredList.isEmpty
                  ? countryListApi.length
                  : filteredList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              filteredList.isEmpty
                                  ? countryListApi[index]
                                  : filteredList[index];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TimePage(
                                        countryName: filteredList.isEmpty
                                            ? countryListApi[index]
                                            : filteredList[index]),
                                  ));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 54,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: value == false
                                            ? ColorPalette
                                                .lightTextBackgroundColor
                                            : ColorPalette
                                                .inputDarkThemeBackgroundColor),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            filteredList.isEmpty
                                                ? countryListApi[index]
                                                : filteredList[index],
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 15,
                                                color: value == false
                                                    ? ColorPalette
                                                        .lightTextColor
                                                    : ColorPalette
                                                        .darkTextColor),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 31,
                                            width: 31,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 2,
                                                    color: value == false
                                                        ? Colors.white
                                                        : ColorPalette
                                                            .darkBackgroundColor)),
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
