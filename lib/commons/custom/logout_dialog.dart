import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/features/onboarding/presentation/welcome_page.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  void logout(BuildContext context) {
    //close the dialog box first, then navigate
    Navigator.of(context).pop();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Text(
        'Log out',
        style: AppTextTheme.secondaryText,
        textAlign: TextAlign.center,
      ),

      content: Text(
        'Are you sure you want to log out?',
        style: AppTextTheme.meduimText,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: AppTextTheme.tinyMeduim.copyWith(fontSize: 16.sp),
              ),
            ),
            TextButton(
              onPressed: () => logout(context),
              child: Text(
                'Log out',
                style: AppTextTheme.tinyMeduim.copyWith(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
