import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  final double? width, height;

  const DashboardCard({
    super.key,
    required this.title,
    this.subtitle = '',
    this.icon = Icons.account_circle,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 250.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: cardborder, width: 1),
          boxShadow: [
            BoxShadow(
              color: fillHintColor,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon
              Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: fillHintColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, size: 24.sp, color: primaryTextColor),
              ),
              SizedBox(height: 8.h),
              // Title and Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextTheme.boldText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(subtitle, style: AppTextTheme.tiny),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
