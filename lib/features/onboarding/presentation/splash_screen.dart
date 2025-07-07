import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quickq/auth_layout.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double splashSize = (screenWidth * 0.6).clamp(200.0, 280.0);

    return AnimatedSplashScreen(
      splash: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Lottie.asset(
              'assets/animation/Animation - 1748808982062.json',
              width: splashSize,
              height: splashSize,
              fit: BoxFit.contain,
              //To handle error incase the animation does not load up
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.error_outline,
                  size: 100.sp,
                  color: buttonColor,
                );
              },
            ),
          ),
          minispacebtwn,
          Text(
            'QUICKIE',
            style: AppTextTheme.tertiaryText.copyWith(letterSpacing: 1.2),
          ),
        ],
      ),
      nextScreen: const AuthLayout(),
      duration: 5000,
      backgroundColor: backgroundColor,
      splashIconSize: splashSize,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
