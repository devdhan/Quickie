import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';
import 'package:quickq/features/mainhomescreen/presentation/dashboard.dart';
import 'package:quickq/features/mainhomescreen/presentation/cafeteria.dart';
import 'package:quickq/features/mainhomescreen/presentation/profile.dart';
import 'package:quickq/features/mainhomescreen/presentation/ticket.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  final List<Widget> pages = [
    const Dashboard(),
    const Cafeteria(),
    const Ticket(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(padding: paddingRoundOne, child: pages[pageIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        currentIndex: pageIndex,
        onTap: (index) {
          HapticFeedback.lightImpact();
          setState(() {
            pageIndex = index;
          });
        },
        selectedLabelStyle: AppTextTheme.tinyMeduim,
        unselectedLabelStyle: AppTextTheme.tinyMeduim,
        iconSize: 24.h,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryTextColor,
        unselectedItemColor: secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(pageIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              pageIndex == 1 ? Icons.restaurant : Icons.restaurant_outlined,
            ),
            label: 'Cafeteria',
          ),
          BottomNavigationBarItem(
            icon: Icon(pageIndex == 2 ? Icons.qr_code : Icons.qr_code_outlined),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              pageIndex == 3
                  ? Icons.account_circle
                  : Icons.account_circle_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
