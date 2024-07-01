import 'package:flutter/material.dart';
import 'package:pokedex/theme/colors.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 48,
        width: 48,
        child: CircularProgressIndicator(
          color: CustomColors.medium,
        ),
      ),
    );
  }
}
