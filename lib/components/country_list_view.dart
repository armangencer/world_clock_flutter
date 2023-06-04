import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_clock_flutter/screens/time_page.dart';
import '../theme/color_palette.dart';
import '../theme/theme.dart';

class CountryList extends StatefulWidget {
  const CountryList({
    super.key,
  });

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  List CountryListApi = [];

  @override
  void initState() {
    super.initState();
    getCountry();
  }

  final url = 'http://worldtimeapi.org/api/timezone';

  Future getCountry() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        CountryListApi = List.from(data);
      });
    } else {
      print('Hata: ${response.statusCode}');
      throw Exception('Hata : ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ValueListenableBuilder(
        valueListenable: ThemeIsDark.isDark,
        builder: (context, value, child) {
          return SizedBox(
            height: 447,
            child: ListView.builder(
              itemCount: CountryListApi.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TimePage(
                                        countryName: CountryListApi[index]),
                                  ));
                            },
                            child: Container(
                              height: 54,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: value == false
                                      ? ColorPalette.lightTextBackgroundColor
                                      : ColorPalette
                                          .inputDarkThemeBackgroundColor),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 18, bottom: 18),
                                child: Text(
                                  CountryListApi[index],
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15,
                                      color: value == false
                                          ? ColorPalette.lightTextColor
                                          : ColorPalette.darkTextColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 270,
                          top: 20,
                          child: Container(
                            height: 31,
                            width: 31,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2,
                                    color: value == false
                                        ? Colors.white
                                        : ColorPalette.darkBackgroundColor)),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                            ),
                          ),
                        )
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
