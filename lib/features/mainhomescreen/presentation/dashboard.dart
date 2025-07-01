import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/commons/custom/cafeteria_card.dart';
import 'package:quickq/features/mainhomescreen/data/datasource/cafeteria_data.dart';
import 'package:quickq/features/mainhomescreen/domain/entities/cafeteria_items.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/commons/themes/text_theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Mock meal data for demonstration
  final List<Map<String, dynamic>> meals = [
    {'name': 'Jollof Rice', 'price': 800, 'cafeteria': 'Jubilee Cafeteria'},
    {'name': 'Fried Rice', 'price': 900, 'cafeteria': 'Buwa Bukateria'},
    {'name': 'Pounded Yam', 'price': 1000, 'cafeteria': 'BBSF Cafeteria'},
    {'name': 'Spaghetti', 'price': 700, 'cafeteria': 'De Destination'},
  ];

  @override
  Widget build(BuildContext context) {
    final List<CafeteriaItem> cafeterias = CafeteriaData.getCafeteriaItems();
    return Scaffold(
      appBar: CustomAppBar(title: 'Welcome to QuickQ!', showLeading: false),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text('Cafeterias', style: AppTextTheme.boldText),
              SizedBox(height: 10.h),
              SizedBox(
                height: 180.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: cafeterias.length,
                  separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 140.w,
                      child: CafeteriaCard(
                        item: cafeterias[index],
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              Text('Available Meals', style: AppTextTheme.boldText),
              SizedBox(height: 12.h),
              ListView.separated(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
                itemCount: meals.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  return Container(
                    padding: EdgeInsets.all(16.w),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(meal['name'], style: AppTextTheme.boldText),
                            SizedBox(height: 4.h),
                            Text(meal['cafeteria'], style: AppTextTheme.tiny),
                            SizedBox(height: 4.h),
                            Text(
                              '₦${meal['price']}',
                              style: AppTextTheme.tinyMeduim,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            foregroundColor: buttonTextColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Durations.short1,
                                content: Text(
                                  'Proceed to payment for ${meal['name']}',
                                ),
                              ),
                            );
                          },
                          child: const Text('Buy Ticket'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
