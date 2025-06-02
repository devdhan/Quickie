import 'package:flutter/material.dart';
import 'package:quickq/constants/sizes.dart';
import 'package:quickq/constants/colors.dart';

class AppTextTheme {
  static final TextStyle tiny = TextStyle(
    fontSize: tinyTextSize,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.normal,
    color: secondaryColor,
  );
  static final TextStyle tinytwo = TextStyle(
    fontSize: tinyTextSize,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.normal,
    color: primaryTextColor,
  );
  static final TextStyle tinyMeduim = TextStyle(
    fontSize: tinyTextSize,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w500,
    color: secondaryColor,
  );
  static final TextStyle regularText = TextStyle(
    fontSize: primaryTextSize,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.normal,
    color: primaryTextColor,
  );
  static final TextStyle meduimText = TextStyle(
    fontSize: primaryTextSize,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w500,
    color: primaryTextColor,
  );
  static final TextStyle boldText = TextStyle(
    fontSize: primaryTextSize,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.bold,
    color: primaryTextColor,
  );
  static final TextStyle secondaryText = TextStyle(
    fontSize: secondaryTextSize,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.bold,
    color: primaryTextColor,
  );
  static final TextStyle tertiaryText = TextStyle(
    fontSize: tertiaryTextSize,
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.bold,
    color: primaryTextColor,
  );
}
