import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';

class OnboardingCard extends StatelessWidget {
  final String title;
  final Color iconColor;
  final Color textColor;
  final IconData icon;
  final bool isSelected;
  const OnboardingCard({
    super.key,
    required this.title,
    this.iconColor = primaryTextColor,
    this.textColor = primaryTextColor,
    this.icon = Icons.person,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        color: isSelected ? buttonColor : Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isSelected ? cardColor : cardborder,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: fillHintColor,
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: paddingRoundOne,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isSelected ? buttonTextColor : cardborder,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? buttonColor : primaryTextColor,
                size: 24.sp,
              ),
            ),
            spacebtwn,
            Text(
              title,
              style: AppTextTheme.boldText.copyWith(
                color: isSelected ? buttonTextColor : primaryTextColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
