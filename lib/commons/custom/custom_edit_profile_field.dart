import 'package:flutter/material.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';

class CustomEditProfileField extends StatelessWidget {
  final String hint;
  const CustomEditProfileField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: fillBorderRadius,
          borderSide: BorderSide(color: Colors.black, width: 4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: fillBorderRadius,
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        filled: true,
        fillColor: fillHintColor,
        hintText: hint,
        hintStyle: AppTextTheme.regularText,
      ),
    );
  }
}
