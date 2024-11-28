import 'package:event_planner/core/utils/app_colors.dart';
import 'package:event_planner/presentation/common_widgets/text_view.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback onPressed;
  final Color? buttonBackgroundColor;
  final double? borderRadius;
  final double? textFontSize;
  final Color? textColor;
  final String? textFontFamily;
  final FontWeight fontWeight;
  final Widget? child;

  const AppButton(
      {super.key,
        this.height = 48,
        this.width = double.infinity,
        required this.title,
        this.margin =
         EdgeInsets.zero,
        this.padding =  EdgeInsets.zero,
        required this.onPressed,
        this.buttonBackgroundColor = AppColors.primaryColor,
        this.child,
        this.borderRadius = 6.0,
        this.textFontSize = 16,
        this.textColor = Colors.white,
        this.textFontFamily,
        this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackgroundColor ,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!)),
        ),
        child: child ??
            TextView(
              fontWeight: fontWeight,
              alignment: Alignment.center,
              title: title,
              fontSize: textFontSize!,
              textColor: textColor!,
              fontFamily: textFontFamily,
            ),
      ),
    );
  }
}