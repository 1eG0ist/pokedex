import 'package:flutter/material.dart';
import 'package:pokedex/theme/colors.dart';
import 'package:pokedex/theme/styles/text_styles.dart';

class SwapSortingDialog extends StatelessWidget {
  final String selected;
  const SwapSortingDialog({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: CustomColors.primary,
      title: const Text('Sort by:', style: CustomTextStyle.subtitle2),
      content: SizedBox(
        width: 100,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CustomColors.white
          ),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  // dense: true,
                  activeColor: CustomColors.primary,
                  fillColor: WidgetStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    return CustomColors.primary;
                  }),
                  title: const Text('Name', style: CustomTextStyle.body3),
                  value: 'name',
                  groupValue: selected,
                  onChanged: (value) {
                    Navigator.of(context).pop(value as String);
                  },
                ),
                RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  // dense: true,
                  activeColor: CustomColors.primary,
                  fillColor: WidgetStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    return CustomColors.primary;
                  }),
                  title: const Text('Number', style: CustomTextStyle.body3),
                  value: 'id',
                  groupValue: selected,
                  onChanged: (value) {
                    Navigator.of(context).pop(value as String);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
