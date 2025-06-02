import 'package:avatar_plus/avatar_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/custom/profile_list.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double avatarSize = (screenWidth * 0.5).clamp(80.0, 150.0);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Text(
                    'Daniel Bolaji',
                    style: AppTextTheme.tertiaryText,
                    textAlign: TextAlign.center,
                  ),
                  spacebtwn,
                  ProfileList(text: 'Edit Profile', onTap: () {}),
                  minispacebtwn,
                  ProfileList(text: 'Payment Methods', onTap: () {}),
                  minispacebtwn,
                  ProfileList(text: 'Transcation History', onTap: () {}),
                  minispacebtwn,
                  ProfileList(text: 'Settings', onTap: () {}),
                  minispacebtwn,
                  ProfileList(text: 'Support', onTap: () {}),
                  minispacebtwn,
                  ProfileList(text: 'Log out', onTap: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
