import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'payment_page.dart';

class MealDetailsPage extends StatelessWidget {
  final String mealName;
  final String cafeteria;
  final int price;

  const MealDetailsPage({
    super.key,
    required this.mealName,
    required this.cafeteria,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details', style: AppTextTheme.secondaryText),
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
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
            Text(
              mealName,
              style: AppTextTheme.boldText.copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 8.h),
            Text('Available at: $cafeteria', style: AppTextTheme.tinyMeduim),
            SizedBox(height: 8.h),
            Text(
              '₦$price',
              style: AppTextTheme.secondaryText.copyWith(color: buttonColor),
            ),
            SizedBox(height: 24.h),
            Text('Description', style: AppTextTheme.boldText),
            SizedBox(height: 8.h),
            Text(
              'A delicious and popular meal among students. Served hot and fresh every day.',
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PaymentPage(
                            mealName: mealName,
                            price: price,
                            cafeteria: cafeteria,
                          ),
                    ),
                  );
                },
                child: const Text('Buy Ticket'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
