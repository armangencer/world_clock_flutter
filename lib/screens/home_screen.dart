import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:world_clock_flutter/constants/constants.dart';
import 'package:world_clock_flutter/models/ip_model.dart';
import 'package:world_clock_flutter/theme/color_palette.dart';
import 'package:world_clock_flutter/theme/theme.dart';
import '../components/country_list_view.dart';
import '../components/search_button.dart';
import '../components/theme_button.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = Uri.parse('http://worldtimeapi.org/api/ip');
  late DateTime ipTime;
  late String timeZone;
  bool isLoading = true;

  Future callTimeZone() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = ipTimeZoneFromJson(response.body);
        print(result.datetime);

        if (mounted) {
          setState(() {
            ipTime = result.datetime;
            timeZone = result.timezone;
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
    callTimeZone();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return ValueListenableBuilder<bool>(
        valueListenable: ThemeIsDark.isDark,
        builder: (context, value, child) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  height: 199,
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
                            timeZone.toString().toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: value == false
                                    ? ColorPalette.lightTextColor
                                    : ColorPalette.darkTextColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Text(
                              DateFormat('HH:mm').format(ipTime),
                              style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w800,
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
                              DateFormat('dd/MM/yyyy').format(ipTime),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  color: value == false
                                      ? ColorPalette.lightTextColor
                                      : ColorPalette.darkTextColor,
                                  fontWeight: FontWeight.w700),
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
}
