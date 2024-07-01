import 'package:flutter/material.dart';
import 'package:pokedex/theme/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      width: 1,
      thickness: 1,
      color: CustomColors.light,
    );
  }
}
