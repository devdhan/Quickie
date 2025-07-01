import 'package:flutter/material.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/commons/custom/custom_red_button.dart';
import 'package:quickq/commons/custom/custom_textfield.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/features/authentication/sign_up.dart';
import 'package:quickq/features/mainhomescreen/presentation/dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController matricNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void dashboard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }

  void signup(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  void dispose() {
    matricNumberController.dispose();
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
              controller: matricNumberController,
              hint: 'Matric Number',
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
          ],
        ),
      ),
    );
  }
}
