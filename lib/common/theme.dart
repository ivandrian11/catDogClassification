import 'package:cat_dog_clf/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color whiteColor = Colors.white;

TextStyle titleStyle = GoogleFonts.abhayaLibre(
  fontSize: (SizeConfig.safeBlockHorizontal * 8.89).roundToDouble(),
  fontWeight: semibold,
  color: whiteColor,
);

TextStyle titleDialogStyle = TextStyle(
  fontWeight: bold,
  color: Color(0xff3E5481),
  fontSize: (SizeConfig.safeBlockHorizontal * 5.56).roundToDouble(),
);

TextStyle contentDialogStyle = TextStyle(
  color: Color(0xff2E3E5C),
  fontWeight: medium,
  fontSize: (SizeConfig.safeBlockHorizontal * 4.17).roundToDouble(),
);

Gradient gradientBackground = LinearGradient(
  colors: [Color(0xff6985E7), Color(0xff4069FB)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);

List<BoxShadow> buttonShadowBlack = [
  BoxShadow(
    color: Colors.black,
    offset: Offset(1, 1),
    blurRadius: 4,
    spreadRadius: 1,
  ),
];

FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
