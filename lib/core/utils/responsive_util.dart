import 'package:flutter/material.dart';

import 'debug_logger.dart';

class Responsive {
  static late Size size;

  // assign your Xd or Figma height and width
  static const _xdHeight = 812;
  static const _xdWidth = 375;

  static double setHeight(num value) {
    double percentage = (value / _xdHeight * 100).roundToDouble() / 100;
    return size.height * percentage;
  }

  static double setWidth(num value) {
    double percentage = (value / _xdWidth * 100).roundToDouble() / 100;
    return size.width * percentage;
  }

  static double setHeightByPercentage(num value) {
    double percentage = value.roundToDouble() / 100;
    return size.height * percentage;
  }

  static double setWidthByPercentage(num value) {
    double percentage = (value).roundToDouble() / 100;
    return size.width * percentage;
  }

  static isSmallDevice() {
    return size.height < 675;
  }
static isMobile() {
    return size.width < 400;
  }

  static printDimensions() {
    debuggerAdvance(tag: "Device Height", value: size.height);
    debuggerAdvance(tag: "Device Width", value: size.width);
  }
}