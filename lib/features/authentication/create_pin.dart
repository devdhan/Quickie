import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/commons/custom/custom_red_button.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';
import 'package:quickq/features/navigation/home.dart';

class CreatePin extends StatelessWidget {
  const CreatePin({super.key});

  void home(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: 'Set Up your Pin', showLeading: false),
      body: Padding(
        padding: paddingRoundOne,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Create your Quick PIN',
                style: AppTextTheme.tertiaryText,
                textAlign: TextAlign.center,
              ),
            ),
            minispacebtwn,
            Center(
              child: Text(
                'This PIN will be used for quick authentication before ticket purchases.',
                style: AppTextTheme.regularText,
                textAlign: TextAlign.center,
              ),
            ),
            spacebtwn,
            OtpTextField(
              numberOfFields: 4,
              showFieldAsBox: true,
              borderColor: secondaryColor,
              borderWidth: 1.w,
              enabledBorderColor: secondaryColor,
              focusedBorderColor: appBarTextColor,
              filled: true,
              fillColor: fillHintColor,
              cursorColor: secondaryColor,
              keyboardType: TextInputType.number,
              textStyle: AppTextTheme.regularText,
              fieldWidth: 50.w,
              margin: otpspacebtwn,
            ),
            Spacer(),
            CustomRedButton(
              text: 'Set your Pin',
              onPressed: () => home(context),
            ),
            spacebtwn,
          ],
        ),
      ),
    );
  }
}
