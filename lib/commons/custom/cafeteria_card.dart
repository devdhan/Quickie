import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/features/mainhomescreen/domain/entities/cafeteria_items.dart';
import '../../../constants/colors.dart';

class CafeteriaCard extends StatelessWidget {
  final CafeteriaItem item;
  final VoidCallback? onTap;

  const CafeteriaCard({Key? key, required this.item, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon
              Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: fillHintColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  _getIconData(item.iconPath),
                  size: 24.sp,
                  color: primaryTextColor,
                ),
              ),
              SizedBox(height: 8.h),
              // Title and Distance
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextTheme.boldText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(item.distance, style: AppTextTheme.tiny),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconData(String iconPath) {
    switch (iconPath) {
      case 'restaurant':
        return Icons.restaurant_outlined;
      case 'ramen':
        return Icons.ramen_dining;
      case 'eco':
        return Icons.eco_outlined;
      case 'local_pizza':
        return Icons.local_pizza_outlined;
      case 'coffee':
        return Icons.coffee_outlined;
      case 'cake':
        return Icons.cake_outlined;
      default:
        return Icons.restaurant_outlined;
    }
  }
}
