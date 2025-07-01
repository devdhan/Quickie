import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/commons/themes/text_theme.dart';

class TicketPage extends StatelessWidget {
  final String mealName;
  final String cafeteria;
  final int price;

  const TicketPage({
    super.key,
    required this.mealName,
    required this.cafeteria,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Ticket', style: AppTextTheme.secondaryText),
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32.h),
            Container(
              width: 200.w,
              height: 200.w,
              decoration: BoxDecoration(
                color: fillHintColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: const Center(
                child: Icon(Icons.qr_code_2, size: 120, color: Colors.grey),
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              mealName,
              style: AppTextTheme.boldText.copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 8.h),
            Text('Cafeteria: $cafeteria', style: AppTextTheme.tinyMeduim),
            SizedBox(height: 8.h),
            Text(
              '₦$price',
              style: AppTextTheme.secondaryText.copyWith(color: buttonColor),
            ),
            const Spacer(),
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
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
