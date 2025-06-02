import 'package:flutter/material.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/commons/custom/custom_red_button.dart';
import 'package:quickq/commons/custom/custom_textfield.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';
import 'package:quickq/features/authentication/sign_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  void signin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: 'SIGN UP', showLeading: false),
      body: Padding(
        padding: paddingRoundOne,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(
              hint: 'Full Name',
              keyboardType: TextInputType.text,
            ),
            spacebtwn,
            CustomTextfield(
              hint: 'Matric Number',
              keyboardType: TextInputType.text,
            ),
            spacebtwn,
            CustomTextfield(
              hint: 'Password',
              obscureText: true,
              keyboardType: TextInputType.text,
              isPassword: true,
            ),
            spacebtwn,
            CustomTextfield(
              hint: 'Confirm Password',
              obscureText: true,
              keyboardType: TextInputType.text,
              isPassword: true,
            ),
            Spacer(),
            CustomRedButton(text: 'Sign Up', onPressed: () => signin(context)),
            spacebtwn,
          ],
        ),
      ),
    );
  }
}
