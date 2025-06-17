import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';

class QuickAction extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final IconData icon;
  const QuickAction({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: constraints.maxWidth > 600 ? 80.w : 0.25.sw,
            height: 90.h,
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
              padding: EdgeInsets.all(8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 24.sp),
                  SizedBox(height: 4.h),
                  Flexible(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.tinytwo.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
