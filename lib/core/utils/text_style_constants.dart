import 'package:flutter/material.dart';

//Info  get FontSize fontWeight color
class AppTextStyle {
  static const FontWeight boldFontWeight = FontWeight.w600;
  static const FontWeight mediumFontWeight = FontWeight.w500;
  static const FontWeight regularFontWeight = FontWeight.w400;



  static const TextStyle eventTitleStyle =  TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontFamily: '',
  fontWeight: boldFontWeight);


  static const TextStyle eventDescriptionStyle =  TextStyle(
  color: Colors.grey,
  fontSize: 12,
  fontFamily: '',
  fontWeight: regularFontWeight);

}
