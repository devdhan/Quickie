import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/commons/themes/text_theme.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: buttonColor, size: 80.sp),
            SizedBox(height: 24.h),
            Text(
              'Payment Successful!',
              style: AppTextTheme.secondaryText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Text(
              'Show this QR code at the cafeteria to collect your meal.',
              style: AppTextTheme.tinyMeduim,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            Container(
              width: 180.w,
              height: 180.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: cardborder, width: 1),
              ),
              child: Center(
                child: Icon(Icons.qr_code_2, size: 120.sp, color: Colors.grey),
              ),
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: buttonTextColor,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {},
                child: const Text('Back to Dashboard'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
