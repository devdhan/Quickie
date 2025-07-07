import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickq/auth_service.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/commons/custom/custom_red_button.dart';
import 'package:quickq/commons/custom/custom_textfield.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  String errorMessage = '';

  void login(BuildContext context) async {
    try {
      await authService.value.resetPassword(email: emailController.text);
      //check email snackbar
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'THERE IS AN ERROR ';
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: 'Reset Password', showLeading: true),
      body: Padding(
        padding: paddingRoundOne,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(
              controller: emailController,
              hint: 'Email Address',
              keyboardType: TextInputType.text,
            ),
            spacebtwn,
            CustomRedButton(
              text: 'Reset Password',
              onPressed: () => login(context),
            ),
            spacebtwn,
            Text(errorMessage, style: TextStyle(color: secondaryColor)),
          ],
        ),
      ),
    );
  }
}
