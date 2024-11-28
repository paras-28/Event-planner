import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String title;
  final double fontSize;
  final double wordSpacing;
  final double minFontSize;
  final double? letterSpacing;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final Border? border;
  final Color textColor;
  final double? width;
  final double? height;
  final double? heightBtw2Lines;
  final double? textScaleFactor;
  final double? decorationThickness;
  final TextStyle? style;
  final TextDecoration textDecoration;
  final Alignment? alignment;
  final int maxLine;
  final bool softWrap;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final BoxShape boxShape;
  final BorderRadius borderRadius;
  final VoidCallback? onPressed;

  const TextView(
      {Key? key,
        required this.title,
        this.margin = EdgeInsets.zero,
        this.padding = EdgeInsets.zero,
        this.fontSize = 16,
        this.backgroundColor = Colors.transparent,
        this.fontWeight = FontWeight.normal,
        this.wordSpacing = 1.0,
        this.width,
        this.border,
        this.height,
        this.style,
        this.minFontSize = 12,
        this.softWrap = true,
        this.textDecoration = TextDecoration.none,
        this.borderRadius = BorderRadius.zero,
        this.alignment,
        this.textColor = Colors.black,
        this.maxLine = 1,
        this.fontFamily,
        this.boxShape = BoxShape.rectangle,
        this.overflow = TextOverflow.visible,
        this.fontStyle = FontStyle.normal,
        this.onPressed,
        this.textScaleFactor = 1.0,
        this.textAlign = TextAlign.start,
        this.decorationThickness = 0,
        this.letterSpacing,
        this.heightBtw2Lines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title.isNotEmpty && title != "null"
        ? InkWell(
      onTap: onPressed,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: borderRadius),
        child: Padding(
            padding: padding!,
            child: AutoSizeText(
              minFontSize: minFontSize,
              title
                  .replaceAll("<p>", "")
                  .replaceAll("</p>", "")
                  .replaceAll('<p style=\"text-align: left;\">', '')
                  .replaceAll("</strong>", "")
                  .replaceAll("<strong>", ""),
              textScaleFactor: textScaleFactor,
              overflow: overflow,
              maxLines: maxLine,
              softWrap: softWrap,
              style: style ??
                  TextStyle(
                      height: heightBtw2Lines,
                      letterSpacing: letterSpacing,
                      // decoration: TextDecoration.underline,

                      decoration: textDecoration,
                      decorationThickness: decorationThickness,
                      fontSize: fontSize,
                      color: textColor,
                      fontFamily: fontFamily,
                      fontStyle: fontStyle!,
                      fontWeight: fontWeight,
                      wordSpacing: wordSpacing),
              textAlign: textAlign,
            )),
      ),
    )
        : const SizedBox.shrink();
  }
}