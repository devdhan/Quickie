import 'package:flutter/material.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/commons/custom/custom_red_button.dart';
import 'package:quickq/commons/custom/custom_textfield.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';
import 'package:quickq/features/authentication/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController matricNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void signin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  void dispose() {
    fullNameController.dispose();
    matricNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
              controller: fullNameController,
              hint: 'Full Name',
              keyboardType: TextInputType.text,
            ),
            spacebtwn,
            CustomTextfield(
              controller: matricNumberController,
              hint: 'Matric Number',
              keyboardType: TextInputType.text,
            ),
            spacebtwn,
            CustomTextfield(
              controller: passwordController,
              hint: 'Password',
              obscureText: true,
              keyboardType: TextInputType.text,
              isPassword: true,
            ),
            spacebtwn,
            CustomTextfield(
              controller: confirmPasswordController,
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
