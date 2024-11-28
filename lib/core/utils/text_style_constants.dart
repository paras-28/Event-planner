import 'package:flutter/material.dart';

//Info  get FontSize fontWeight color
class AppTextStyle {
  static const FontWeight boldFontWeight = FontWeight.w600;
  static const FontWeight mediumFontWeight = FontWeight.w500;
  static const FontWeight regularFontWeight = FontWeight.w400;
  static const FontWeight lightFontWeight = FontWeight.w400;





  // 16 regular F600
  static get12regular({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontSize: 12,
        fontFamily: '',
        fontWeight: regularFontWeight);
  }

  static get12bold({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontSize: 12,
        fontFamily: '',
        fontWeight: regularFontWeight);
  }

  static get13regular({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontSize: 13,
        fontFamily: '',
        fontWeight: regularFontWeight);
  }

  // 16 regular F600
  static get14regular({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontSize: 14,
        fontFamily: '',
        fontWeight: regularFontWeight);
  }

  static get14bold({Color color = Colors.black}) {
    return TextStyle(
        color: color, fontSize: 14, fontFamily: '', fontWeight: boldFontWeight);
  }

  static get15bold({Color color = Colors.black}) {
    return TextStyle(
        color: color, fontSize: 15, fontFamily: '', fontWeight: boldFontWeight);
  }

  // 16 regular F600
  static get16regular({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: '',
        fontWeight: regularFontWeight);
  }

  // 16 bold F600
  static get16bold({Color color = Colors.black}) {
    return TextStyle(
      fontSize: 16,
      fontFamily: '',
      fontWeight: boldFontWeight,
      color: color,
    );
  }

  // 16 bold F600
  static get16boldOverFlowEllipsis({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: '',
        fontWeight: boldFontWeight,
        overflow: TextOverflow.ellipsis);
  } // 16 bold F600

  static get16regularOverFlowEllipsis({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: '',
        fontWeight: regularFontWeight,
        overflow: TextOverflow.ellipsis);
  }

  // 16 regular underLine
  static get16regularUnderLine({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        decoration: TextDecoration.underline,
        decorationThickness: 2,
        fontSize: 16,
        fontFamily: '',
        fontWeight: regularFontWeight);
  }

  // 17 bold
  static get17bold({Color color = Colors.black}) {
    return TextStyle(
        fontSize: 17, fontFamily: '', color: color, fontWeight: boldFontWeight);
  }

  // 18 bold
  static get18regular({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontSize: 18,
        fontFamily: '',
        fontWeight: regularFontWeight);
  }

  // 18 bold
  static get18bold({Color color = Colors.black}) {
    return TextStyle(
        color: color, fontSize: 18, fontFamily: '', fontWeight: boldFontWeight);
  }

  // 20 bold F600
  static get20Bold({Color color = Colors.black}) {
    return TextStyle(
        color: color, fontSize: 20, fontFamily: '', fontWeight: boldFontWeight);
  } // 20 bold F600

  static get20regular({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontSize: 20,
        fontFamily: '',
        fontWeight: regularFontWeight);
  }

  // 24 regular
  static get24bold({Color color = Colors.black}) {
    return TextStyle(
        color: color, fontSize: 24, fontFamily: '', fontWeight: boldFontWeight);
  }

  static get26bold({Color color = Colors.black}) {
    return TextStyle(
      fontSize: 26,
      fontFamily: '',
      fontWeight: boldFontWeight,
      color: color,
    );
  }

  // 30  regular
  static get30regular({Color color = Colors.black}) {
    return TextStyle(
      fontSize: 30,
      fontFamily: '',
      fontWeight: regularFontWeight,
      color: color,
    );
  }

  static get30bold({Color color = Colors.black}) {
    return TextStyle(
      fontSize: 30,
      fontFamily: '',
      fontWeight: boldFontWeight,
      color: color,
    );
  }

  static get32bold({Color color = Colors.black}) {
    return TextStyle(
      fontSize: 32,
      fontFamily: '',
      fontWeight: boldFontWeight,
      color: color,
    );
  }
}
