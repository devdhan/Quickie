import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/commons/custom/dashboard_card.dart';
import 'package:quickq/commons/custom/quick_action.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: 'Dashboard', showLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: paddingRoundOne,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Popular Cafeteria', style: AppTextTheme.boldText),
                  minispacebtwn,
                  SizedBox(
                    height: 140.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        DashboardCard(
                          title: 'Jubilee Cafeteria',
                          subtitle: '',
                          icon: Icons.restaurant_outlined,
                          onTap: () {
                            // Handle tap for Jubilee Cafeteria
                            print('Jubilee Cafeteria tapped');
                          },
                        ),
                        SizedBox(width: 12.w),
                        DashboardCard(
                          title: 'Buwa Bukateria',
                          subtitle: '',
                          icon: Icons.restaurant_outlined,
                          onTap: () {
                            // Handle tap for Buwa Bukateria
                            print('Buwa Bukateria tapped');
                          },
                        ),
                        SizedBox(width: 12.w),
                        DashboardCard(
                          title: 'BBSF Cafeteria',
                          subtitle: '',
                          icon: Icons.restaurant_outlined,
                          onTap: () {
                            // Handle tap for BBSF Cafeteria
                            print('BBSF Cafeteria tapped');
                          },
                        ),
                        SizedBox(width: 12.w),
                        DashboardCard(
                          title: 'De Destination Cafeteria',
                          subtitle: '',
                          icon: Icons.restaurant_outlined,
                          onTap: () {
                            // Handle tap for Jubilee Cafeteria
                            print('De Destination Cafeteria tapped');
                          },
                        ),
                      ],
                    ),
                  ),
                  spacebtwn,
                  Text('Quick Action', style: AppTextTheme.boldText),
                  minispacebtwn,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QuickAction(
                        title: 'Buy Ticket',
                        icon: Icons.restaurant,
                        onTap: () {
                          print('buy ticket');
                        },
                      ),
                      SizedBox(width: 12.w),
                      QuickAction(
                        title: 'Ticket History',
                        icon: Icons.qr_code,
                        onTap: () {
                          print('buy ticket');
                        },
                      ),
                      SizedBox(width: 12.w),
                      QuickAction(
                        title: 'Profile',
                        icon: Icons.account_circle,
                        onTap: () {
                          print('profile');
                        },
                      ),
                    ],
                  ),
                  spacebtwn,
                  spacebtwn,
                  Text('Previous Cafeteria', style: AppTextTheme.boldText),
                  minispacebtwn,
                  SizedBox(
                    height: 140.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        DashboardCard(
                          title: 'Jubille Cafeteria',
                          subtitle: '',
                          icon: Icons.restaurant_outlined,
                          onTap: () {
                            // Handle tap for Jubilee Cafeteria
                            print('De Destination Cafeteria tapped');
                          },
                        ),
                        SizedBox(width: 12.w),
                        DashboardCard(
                          title: 'Glory Cafeteria',
                          subtitle: '',
                          icon: Icons.restaurant_outlined,
                          onTap: () {
                            // Handle tap for Jubilee Cafeteria
                            print('De Destination Cafeteria tapped');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
