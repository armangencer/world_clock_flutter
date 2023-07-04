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

List<String> countryListApi = [];
List filteredList = [];

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  final urlApiIp = ('http://worldtimeapi.org/api/timezone/Europe/Istanbul');
  final url = 'http://worldtimeapi.org/api/timezone';
  late DateTime ipTime;
  late String timeZone;
  late String utc;
  bool isLoading = true;

  @override
  void initState() {
    callTimeZone();
    getCountry();
    super.initState();
  }

  Future getCountry() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        countryListApi = List.from(data);
      });
    } else {
      print('Hata: ${response.statusCode}');
      throw Exception('Hata : ${response.statusCode}');
    }
  }

  Future callTimeZone() async {
    try {
      final response = await http.get(Uri.parse(urlApiIp));
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

  void filterSearchResults(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        filteredList = [];
      } else {
        filteredList = countryListApi
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
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
      return ValueListenableBuilder<bool>(
        valueListenable: ThemeIsDark.isDark,
        builder: (context, value, child) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Stack(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 33, vertical: 69),
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
                          SearchButton(
                            textEditingController: searchController,
                            onChanged: (String query) {
                              filterSearchResults(query);
                            },
                          ),
                          // ignore: prefer_const_constructors
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
              ),
            ),
          );
        },
      );
    }
  }
}
