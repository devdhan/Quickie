import 'package:flutter/material.dart';
import 'package:quickq/commons/themes/text_theme.dart';

class AvailabilityTimeScreen extends StatelessWidget {
  final String mealName;
  final VoidCallback? onCheckMenu;
  const AvailabilityTimeScreen({
    Key? key,
    required this.mealName,
    this.onCheckMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Availability Time')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Meal: $mealName', style: AppTextTheme.regularText),
            const SizedBox(height: 16),
            Text(
              'Meal availability from 10am - 6pm daily.',
              style: AppTextTheme.secondaryText,
            ),
            const SizedBox(height: 24),
            // ElevatedButton(
            //   onPressed: onCheckMenu,
            //   child: const Text('Check Menu'),
            // ),
          ],
        ),
      ),
    );
  }
}
