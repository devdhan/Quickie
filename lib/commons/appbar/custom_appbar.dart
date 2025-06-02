import 'package:flutter/material.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/constants/sizes.dart';
import 'package:quickq/commons/themes/text_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeading;

  const CustomAppBar({Key? key, required this.title, this.showLeading = true})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextTheme.secondaryText,
        textAlign: TextAlign.center,
      ),
      leading:
          showLeading
              ? IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: Icon(Icons.chevron_left_rounded),
              )
              : null,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
