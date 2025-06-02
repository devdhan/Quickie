import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/custom/custom_red_button.dart';
import 'package:quickq/commons/custom/onboarding_card.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';
import 'package:quickq/features/authentication/sign_in.dart';
import 'package:quickq/features/authentication/sign_up.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  //Logic to Navigate to Sign Up
  void signup(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  //Logic to Navigate to Sign In
  void signin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  //Index for when the container is selected to know which one is selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: paddingRoundOne,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Text with brand name, Tagline
                Text(
                  'QUICKIE',
                  style: AppTextTheme.tertiaryText.copyWith(
                    letterSpacing: 2.0.w,
                    color: buttonColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Text(
                  'No Queue, Just Quickie',
                  style: AppTextTheme.secondaryText.copyWith(
                    letterSpacing: 1.0.w,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Order. Scan. Eat.',
                  style: AppTextTheme.meduimText.copyWith(letterSpacing: 0.9.w),
                ),
                spacebtwn,
                spacebtwn,
                Text(
                  'SIGN UP',
                  style: AppTextTheme.secondaryText.copyWith(
                    letterSpacing: 1.0.w,
                    color: buttonColor,
                  ),
                ),
                minispacebtwn,
                //Brief Brand Description
                Text(
                  'Choose from any cafeteria on campus and see what’s cooking. Browse daily menus, check meal availability, and buy your ticket in seconds—anytime, anywhere, hassle-free. Pay, get your QR code, and skip the line. Quickie makes it that easy.',
                  style: AppTextTheme.tinyMeduim.copyWith(
                    letterSpacing: 1.0.w,
                    color: primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                spacebtwn,
                //Container to select which user: Staff or Student
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => selectedIndex = 0),
                      child: OnboardingCard(
                        title: 'Sign Up as \na Student',
                        icon: Icons.person,
                        isSelected: selectedIndex == 0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => selectedIndex = 1),
                      child: OnboardingCard(
                        title: 'Sign Up as \na Staff',
                        icon: Icons.person,
                        isSelected: selectedIndex == 1,
                      ),
                    ),
                  ],
                ),
                spacebtwn,
                //If user already has an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: AppTextTheme.tinytwo,
                      textAlign: TextAlign.center,
                    ),
                    spaceRowbtwn,
                    GestureDetector(
                      onTap: () => signup(context),
                      child: Text(
                        "Sign In",
                        style: AppTextTheme.tiny,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //proceed Custom button
                CustomRedButton(
                  text: 'Proceed',
                  onPressed: () => signup(context),
                ),
                spacebtwn,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
