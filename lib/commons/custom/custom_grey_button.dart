import 'package:flutter/material.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';

class CustomGreyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomGreyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(buttonColor),
          foregroundColor: WidgetStateProperty.all(buttonTextColor),
          padding: WidgetStateProperty.all(paddingVertical),
          textStyle: WidgetStateProperty.all(
            AppTextTheme.boldText.copyWith(color: buttonTextColor),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: buttonRadius),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
