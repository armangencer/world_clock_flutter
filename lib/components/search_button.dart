import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../theme/color_palette.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99), color: Colors.white),
        height: 44,
        child: TextField(
          style: const TextStyle(color: Colors.black),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            prefixIcon: Image.asset(searchIcon),
            hintText: 'Arama',
            hintStyle: const TextStyle(
                color: ColorPalette.lightTextColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 12),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff8FAFE0)),
              borderRadius: BorderRadius.circular(
                99,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff8FAFE0)),
              borderRadius: BorderRadius.circular(
                99,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
