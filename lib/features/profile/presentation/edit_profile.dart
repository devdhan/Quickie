import 'package:avatar_plus/avatar_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/commons/custom/custom_edit_profile_field.dart';
import 'package:quickq/commons/custom/custom_red_button.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double avatarSize = (screenWidth * 0.5).clamp(80.0, 150.0);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: '', showLeading: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: Column(
              children: [
                minispacebtwn,
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: cardborder, width: 3.w),
                  ),
                  child: AvatarPlus(
                    "Daniel",
                    height: avatarSize,
                    width: avatarSize,
                  ),
                ),
                spacebtwn,
                spacebtwn,
                CustomEditProfileField(hint: 'Danel Bolaji'),
                spacebtwn,
                CustomEditProfileField(hint: 'BU21CSC1043'),
                spacebtwn,
                CustomEditProfileField(hint: 'Password'),
                spacebtwn,
                CustomEditProfileField(hint: 'PIN Option'),
                spacebtwn,
                spacebtwn,
                CustomRedButton(text: 'Update Profile', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
