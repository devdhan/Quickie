import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/custom/custom_red_button.dart';
import 'package:quickq/commons/custom/onboarding_card.dart';
import 'package:quickq/commons/enums/user_type.dart';
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
  UserType selectedUserType = UserType.student;

  /// Navigate to Sign Up page with selected user type
  void _navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUp(userType: selectedUserType),
      ),
    );
  }

  /// Navigate to Sign In page
  void _navigateToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: paddingRoundOne,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildBrandHeader(),
                      spacebtwn,
                      spacebtwn,
                      _buildSignUpSection(),
                      spacebtwn,
                      _buildUserTypeSelection(),
                      spacebtwn,
                      _buildSignInPrompt(),
                    ],
                  ),
                ),
              ),
              _buildProceedButton(),
              spacebtwn,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandHeader() {
    return Column(
      children: [
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
          style: AppTextTheme.secondaryText.copyWith(letterSpacing: 1.0.w),
        ),
        SizedBox(height: 4.h),
        Text(
          'Order. Scan. Eat.',
          style: AppTextTheme.meduimText.copyWith(letterSpacing: 0.9.w),
        ),
      ],
    );
  }

  Widget _buildSignUpSection() {
    return Column(
      children: [
        Text(
          'SIGN UP',
          style: AppTextTheme.secondaryText.copyWith(
            letterSpacing: 1.0.w,
            color: buttonColor,
          ),
        ),
        minispacebtwn,
        Text(
          "Choose from any cafeteria on campus and see what's cooking. Browse daily menus, check meal availability, and buy your ticket in seconds—anytime, anywhere, hassle-free. Pay, get your QR code, and skip the line. Quickie makes it that easy.",
          style: AppTextTheme.tinyMeduim.copyWith(
            letterSpacing: 1.0.w,
            color: primaryTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildUserTypeSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () => setState(() => selectedUserType = UserType.student),
          child: OnboardingCard(
            title: 'Sign Up as \na Student',
            icon: Icons.school,
            isSelected: selectedUserType == UserType.student,
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => selectedUserType = UserType.staff),
          child: OnboardingCard(
            title: 'Sign Up as \na Staff',
            icon: Icons.work,
            isSelected: selectedUserType == UserType.staff,
          ),
        ),
      ],
    );
  }

  Widget _buildSignInPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an Account?",
          style: AppTextTheme.tinytwo,
          textAlign: TextAlign.center,
        ),
        spaceRowbtwn,
        GestureDetector(
          onTap: () => _navigateToSignIn(context),
          child: Text(
            "Sign In",
            style: AppTextTheme.tiny,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildProceedButton() {
    return CustomRedButton(
      text: 'Proceed',
      onPressed: () => _navigateToSignUp(context),
    );
  }
}
