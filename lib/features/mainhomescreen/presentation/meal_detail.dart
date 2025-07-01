import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/commons/themes/text_theme.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'),
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 180.w,
                height: 180.w,
                decoration: BoxDecoration(
                  color: fillHintColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: const Icon(Icons.fastfood, size: 80, color: Colors.grey),
              ),
            ),
            SizedBox(height: 24.h),
            Text('Jollof Rice', style: AppTextTheme.secondaryText),
            SizedBox(height: 8.h),
            Text('Jubilee Cafeteria', style: AppTextTheme.tinyMeduim),
            SizedBox(height: 8.h),
            Text(
              '₦800',
              style: AppTextTheme.boldText.copyWith(color: buttonColor),
            ),
            SizedBox(height: 32.h),
            Text(
              'A delicious serving of Jollof Rice with chicken and plantain. Served hot and fresh.',
              style: AppTextTheme.tiny,
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
                onPressed: () {},
                child: const Text('Buy Ticket'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
