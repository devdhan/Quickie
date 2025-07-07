import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickq/auth_service.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/commons/custom/custom_red_button.dart';
import 'package:quickq/commons/custom/custom_textfield.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/features/authentication/reset_password.dart';
import 'package:quickq/features/authentication/sign_up.dart';
import 'package:quickq/features/navigation/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  void dashboard(BuildContext context) async {
    try {
      await authService.value.signIn(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'this is not working';
      });
    }
  }

  void signup(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  void resetpassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPassword()),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: 'Welcome Back', showLeading: true),
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
            CustomTextfield(
              controller: passwordController,
              hint: 'Password',
              keyboardType: TextInputType.text,
              obscureText: true,
              isPassword: true,
            ),
            const SizedBox(height: 5.0),
            GestureDetector(
              onTap: () => resetpassword(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: AppTextTheme.tiny,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            spacebtwn,
            CustomRedButton(text: 'Login', onPressed: () => dashboard(context)),
            spacebtwn,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: AppTextTheme.tinytwo,
                  textAlign: TextAlign.center,
                ),
                spaceRowbtwn,
                GestureDetector(
                  onTap: () => signup(context),
                  child: Text(
                    "Sign up",
                    style: AppTextTheme.tiny,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            spacebtwn,
            Text(errorMessage, style: TextStyle(color: secondaryColor)),
          ],
        ),
      ),
    );
  }
}
