import 'package:flutter/material.dart';

class SkillBar extends StatelessWidget {
  final double currentValue;
  final Color color;
  final double maxValue;
  final double height;

  SkillBar({
    Key? key,
    required this.currentValue,
    required this.color,
    this.maxValue = 250.0,
    this.height = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double fraction = currentValue / maxValue;

    return Expanded(
      child: SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: Stack(
            children: [
              Container(
                height: height,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(height / 2),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: fraction,
                  child: Container(
                    height: height,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(height / 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}