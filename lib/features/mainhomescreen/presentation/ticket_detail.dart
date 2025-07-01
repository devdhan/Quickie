import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/commons/themes/text_theme.dart';

class TicketDetailPage extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool isActive;
  const TicketDetailPage({
    super.key,
    required this.ticket,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Details'),
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
            Text(
              'Cafeteria: ${ticket['cafeteria']}',
              style: AppTextTheme.secondaryText,
            ),
            // SizedBox(height: 8.h),
            // Text('Meal: ${ticket['meal']}', style: AppTextTheme.boldTextTwo),
            SizedBox(height: 8.h),
            Text(
              'Date Bought: ${ticket['dateBought']}',
              style: AppTextTheme.tiny,
            ),
            Text(
              'Time Bought: ${ticket['timeBought']}',
              style: AppTextTheme.tinyMeduim,
            ),
            if (!isActive) ...[
              SizedBox(height: 8.h),
              Text(
                'Date Used: ${ticket['dateUsed']}',
                style: AppTextTheme.tinyMeduim,
              ),
              Text(
                'Time Used: ${ticket['timeUsed']}',
                style: AppTextTheme.tinyMeduim,
              ),
            ],
            SizedBox(height: 32.h),
            if (isActive) ...[
              Center(
                child: Container(
                  width: 180.w,
                  height: 180.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: cardborder, width: 1),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.qr_code_2,
                      size: 120.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ] else ...[
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
                  child: const Text('Rebuy'),
                ),
              ),
            ],
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
