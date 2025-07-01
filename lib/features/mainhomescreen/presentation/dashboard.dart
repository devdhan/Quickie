import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/custom/cafeteria_card.dart';
import 'package:quickq/features/mainhomescreen/data/datasource/cafeteria_data.dart';
import 'package:quickq/features/mainhomescreen/domain/entities/cafeteria_items.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'meal_details.dart';
import 'payment_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to QuickQ!', style: AppTextTheme.secondaryText),
              SizedBox(height: 8.h),
              Text(
                'Order your meal, pay online, and skip the queue.',
                style: AppTextTheme.tinyMeduim,
              ),
              SizedBox(height: 24.h),
              Text('Cafeterias', style: AppTextTheme.boldText),
              SizedBox(height: 10.h),
              SizedBox(
                height: 200.h,
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
              Expanded(
                child: ListView.separated(
                  itemCount: meals.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final meal = meals[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => MealDetailsPage(
                                  mealName: meal['name'],
                                  cafeteria: meal['cafeteria'],
                                  price: meal['price'],
                                ),
                          ),
                        );
                      },
                      child: Container(
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
                                Text(
                                  meal['name'],
                                  style: AppTextTheme.boldText,
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  meal['cafeteria'],
                                  style: AppTextTheme.tiny,
                                ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => PaymentPage(
                                          mealName: meal['name'],
                                          price: meal['price'],
                                          cafeteria: meal['cafeteria'],
                                        ),
                                  ),
                                );
                              },
                              child: const Text('Buy Ticket'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
