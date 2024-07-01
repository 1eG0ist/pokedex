import "dart:ui";

import "package:flutter/material.dart";
import "package:pokedex/theme/colors.dart";

class CustomTextStyle {
  static const headline = TextStyle(
    fontFamily: "Poppins-Regular",
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: CustomColors.white
  );

  static TextStyle subtitle1(Color color) {
    return TextStyle(
        fontFamily: "Poppins-Regular",
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: color
    );
  }

  static const subtitle2 = TextStyle(
      fontFamily: "Poppins-Regular",
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: CustomColors.white
  );

  static TextStyle subtitle3({Color color = CustomColors.white}) {
    return TextStyle(
        fontFamily: "Poppins-Regular",
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: color
    );
  }

  static const body1 = TextStyle(
      fontFamily: "Poppins-Regular",
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: CustomColors.white
  );

  static const body2 = TextStyle(
      fontFamily: "Poppins-Regular",
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: CustomColors.white
  );

  static const body3 = TextStyle(
      fontFamily: "Poppins-Regular",
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: CustomColors.dark
  );

  static const caption = TextStyle(
      fontFamily: "Poppins-Regular",
      fontSize: 8,
      fontWeight: FontWeight.normal,
      color: CustomColors.medium
  );
}