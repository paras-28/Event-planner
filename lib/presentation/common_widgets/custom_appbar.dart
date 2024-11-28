import 'package:event_planner/core/utils/is_list_exist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';



class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? keyName;
  final Color titleColor;

  final bool hasArrow;
  final VoidCallback? onBackPressed;
  final Widget? titleWidget;
  final IconData backArrowIcon;

  final Color backArrowColor;
  final Color toolbarBackgroundColor;

  final List<Widget> actions;
  final String? fontFamily;
  final bool centerTitle;
  final PreferredSizeWidget? bottomWidget;

  const CustomAppbar({
    super.key,
    required this.title,
    this.hasArrow = true,
    this.titleColor = Colors.white,
    this.backArrowIcon = Icons.arrow_back_ios,
    this.backArrowColor = Colors.white,
    this.toolbarBackgroundColor = AppColors.primaryColor,
    this.actions = const [],
    this.centerTitle = true,
    this.keyName,
    this.onBackPressed,
    this.titleWidget,
    this.fontFamily,
    this.bottomWidget,
  });


  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        // You can use this as well
        statusBarIconBrightness: Brightness.light,
        // OR Vice Versa for ThemeMode.dark
        statusBarBrightness: Brightness.light,
      ),
      leading: hasArrow
          ? IconButton(
              key: stringHasValue(keyName) ? Key(keyName!) : const Key("key"),
              onPressed: onBackPressed ??
                  () {
                    Navigator.pop(context);
                  },
              icon: Icon(
                backArrowIcon,
                color: backArrowColor,
              ),
            )
          : const SizedBox(),
      elevation: 0,
      title: titleWidget ??
          Text(
            title,
            style: TextStyle(
                color: titleColor,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily ?? ''),
          ),
      backgroundColor: toolbarBackgroundColor,
      actions: actions,
      centerTitle: centerTitle,
      bottom: bottomWidget,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
