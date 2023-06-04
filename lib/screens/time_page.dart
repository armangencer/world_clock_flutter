import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:intl/intl.dart';
import 'package:world_clock_flutter/constants/constants.dart';
import 'package:world_clock_flutter/models/country_time_model.dart';
import 'package:world_clock_flutter/theme/color_palette.dart';
import 'package:world_clock_flutter/theme/theme.dart';

class TimePage extends StatefulWidget {
  final String countryName;
  const TimePage({
    super.key,
    required this.countryName,
  });

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  late var selectedDateTime;
  late var utcDate;
  late var utcOffset;
  bool isLoading = true;

  Future getCountryTime() async {
    try {
      final url = Uri.parse(
          'http://worldtimeapi.org/api/timezone/${widget.countryName}');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = countryTimeModelFromJson(response.body);
        print(result.datetime);
        print(result.utcDatetime);
        print(result.utcOffset);

        if (mounted) {
          setState(() {
            selectedDateTime = result.datetime;
            utcDate = result.utcDatetime;
            utcOffset = result.utcOffset;
          });
          return result;
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCountryTime();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.lightBlue,
          color: Colors.blueAccent,
        )),
      );
    } else {
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
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 161),
                            child: Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                color: value == false
                                    ? ColorPalette.scaffoldBackgroundColor
                                    : ColorPalette.dartTextBackgroundColor,
                                borderRadius: BorderRadius.circular(14),
                                border: value == false
                                    ? Border.all(
                                        width: 2,
                                        color: ColorPalette.lightTextColor)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  DateFormat('HH').format(selectedDateTime),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 160),
                            child: Text(
                              ':',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 50,
                                color: value == false
                                    ? ColorPalette.lightTextColor
                                    : ColorPalette.darkTextColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 161),
                            child: Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                color: value == false
                                    ? ColorPalette.scaffoldBackgroundColor
                                    : ColorPalette.dartTextBackgroundColor,
                                borderRadius: BorderRadius.circular(14),
                                border: value == false
                                    ? Border.all(
                                        width: 2,
                                        color: ColorPalette.lightTextColor)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  DateFormat('mm').format(selectedDateTime),
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 329),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          widget.countryName,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
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
                            textAlign: TextAlign.center,
                            DateFormat(
                                    'EEEE \'GMT\' ${utcOffset.toString()} \n MMMM d , y')
                                .format(utcDate),
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
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
}
