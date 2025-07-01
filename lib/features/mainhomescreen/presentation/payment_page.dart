import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'ticket_page.dart';

class PaymentPage extends StatelessWidget {
  final String mealName;
  final int price;
  final String cafeteria;

  const PaymentPage({
    super.key,
    required this.mealName,
    required this.price,
    required this.cafeteria,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment', style: AppTextTheme.secondaryText),
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
            SizedBox(height: 32.h),
            Center(child: Icon(Icons.payment, size: 80, color: buttonColor)),
            SizedBox(height: 32.h),
            Text('Meal', style: AppTextTheme.tinyMeduim),
            Text(mealName, style: AppTextTheme.boldText),
            SizedBox(height: 16.h),
            Text('Cafeteria', style: AppTextTheme.tinyMeduim),
            Text(cafeteria, style: AppTextTheme.boldText),
            SizedBox(height: 16.h),
            Text('Total Price', style: AppTextTheme.tinyMeduim),
            Text(
              '₦$price',
              style: AppTextTheme.secondaryText.copyWith(
                color: buttonColor,
                fontSize: 22.sp,
              ),
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
                          (context) => TicketPage(
                            mealName: mealName,
                            cafeteria: cafeteria,
                            price: price,
                          ),
                    ),
                  );
                },
                child: const Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
