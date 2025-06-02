import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/features/mainhomescreen/data/datasource/cafeteria_data.dart';
import 'package:quickq/features/mainhomescreen/domain/entities/cafeteria_items.dart';
import 'cafeteria_card.dart';

class CafeteriaGrid extends StatelessWidget {
  const CafeteriaGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cafeteriaItems = CafeteriaData.getCafeteriaItems();
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust cross axis count based on screen width
    int crossAxisCount = 2;
    if (screenWidth > 600) {
      crossAxisCount = 3; // Tablets
    } else if (screenWidth > 900) {
      crossAxisCount = 4; // Large tablets/desktop
    }

    // Adjust aspect ratio based on screen size
    double aspectRatio = 0.9;
    if (screenWidth < 350) {
      aspectRatio = 0.75;
    } else if (screenWidth > 600) {
      aspectRatio = 0.85;
    }

    return GridView.builder(
      padding: EdgeInsets.all(16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: aspectRatio,
      ),
      itemCount: cafeteriaItems.length,
      itemBuilder: (context, index) {
        return CafeteriaCard(
          item: cafeteriaItems[index],
          onTap: () => _onCafeteriaItemTap(context, cafeteriaItems[index]),
        );
      },
    );
  }

  void _onCafeteriaItemTap(BuildContext context, CafeteriaItem item) {
    print('Tapped on: ${item.title}');
  }
}
