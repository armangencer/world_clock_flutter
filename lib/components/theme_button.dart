import 'package:flutter/cupertino.dart';
import '../constants/constants.dart';
import '../theme/theme.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({
    super.key,
  });

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ThemeIsDark.isDark.value = !ThemeIsDark.isDark.value;
      },
      child: ValueListenableBuilder(
        valueListenable: ThemeIsDark.isDark,
        builder: (context, value, child) {
          return value ? Image.asset(sunLogo) : Image.asset(vectorLogo);
        },
      ),
    );
  }
}
