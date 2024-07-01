import 'package:flutter/material.dart';


class CustomColors {
  static const Color primary = Color(0xFFDC0A2D);
  static const Color typeBug = Color(0xFFA7B723);
  static const Color typeDark = Color(0xFF75574C);
  static const Color typeDragon = Color(0xFF7037FF);
  static const Color typeElectric = Color(0xFFF9CF30);
  static const Color typeFairy = Color(0xFFE69EAC);
  static const Color typeFighting = Color(0xFFC12239);
  static const Color typeFire = Color(0xFFF57D31);
  static const Color typeFlying = Color(0xFFA891EC);
  static const Color typeGhost = Color(0xFF70559B);
  static const Color typeNormal = Color(0xFFAAA67F);
  static const Color typeGrass = Color(0xFF74CB48);
  static const Color typeGround = Color(0xFFDEC16B);
  static const Color typeIce = Color(0xFF9AD6DF);
  static const Color typePoison = Color(0xFFA43E9E);
  static const Color typePsychic = Color(0xFFFB5584);
  static const Color typeRock = Color(0xFFB69E31);
  static const Color typeSteel = Color(0xFFB7B9D0);
  static const Color typeWater = Color(0xFF6493EB);
  static const Color dark = Color(0xFF212121);
  static const Color medium = Color(0xFF666666);
  static const Color light = Color(0xFFE0E0E0);
  static const Color background = Color(0xFFEFEFEF);
  static const Color white = Color(0xFFFFFFFF);

  static Color getNeededColor(String colorName) {
    if (colorName == "bug") return CustomColors.typeBug;
    if (colorName == "dark") return CustomColors.typeDark;
    if (colorName == "dragon") return CustomColors.typeDragon;
    if (colorName == "electric") return CustomColors.typeElectric;
    if (colorName == "fairy") return CustomColors.typeFairy;
    if (colorName == "fighting") return CustomColors.typeFighting;
    if (colorName == "fire") return CustomColors.typeFire;
    if (colorName == "flying") return CustomColors.typeFlying;
    if (colorName == "ghost") return CustomColors.typeGhost;
    if (colorName == "normal") return CustomColors.typeNormal;
    if (colorName == "grass") return CustomColors.typeGrass;
    if (colorName == "ground") return CustomColors.typeGround;
    if (colorName == "ice") return CustomColors.typeIce;
    if (colorName == "poison") return CustomColors.typePoison;
    if (colorName == "psychic") return CustomColors.typePsychic;
    if (colorName == "rock") return CustomColors.typeRock;
    if (colorName == "steel") return CustomColors.typeSteel;
    if (colorName == "water") return CustomColors.typeWater;
    return primary;
  }
}