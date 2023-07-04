import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_flutter/components/country_list_view.dart';
import 'package:world_clock_flutter/screens/home_screen.dart';
import '../constants/constants.dart';
import '../theme/color_palette.dart';

class SearchButton extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function(String) onChanged;
  const SearchButton({
    super.key,
    required this.textEditingController,
    required this.onChanged,
  });

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99), color: Colors.white),
        height: 44,
        child: TextField(
          controller: widget.textEditingController,
          onChanged: widget.onChanged,
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
