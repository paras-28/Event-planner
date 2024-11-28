import 'dart:developer';

import 'package:event_planner/core/utils/is_list_exist.dart';

import 'date_formatters.dart';

class Validator {
  Validator._();

  static bool isHTML(String str) {
    final RegExp htmlRegExp =
    RegExp('<[^>]*>', multiLine: true, caseSensitive: false);
    return htmlRegExp.hasMatch(str);
  }

  static final RegExp _emailRgex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  // ignore: prefer_function_declarations_over_variables
  static Function validateEmail = (String? input) {
    if (input != null && _emailRgex.hasMatch(input)) {
      return null;
    } else {
      return "please enter a valid email address";
    }
  };

  static bool validateURL(String? input) {
    if (stringHasValue(input)) {
      return Uri.parse(input!).host.isNotEmpty;
    } else {
      return false;
    }
  }

  static final RegExp _passwordRegx = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%/^&*-]).{8,}$');

  // ignore: prefer_function_declarations_over_variables
  static Function validatePassword = (String? input) {
    if (input != null && _passwordRegx.hasMatch(input)) {
      return null;
    } else {
      return "password_requirement_text" ;
    }
  };

  // ignore: prefer_function_declarations_over_variables
  static Function validateCardNumber = (String input) {
    if (input.isNotEmpty && input.trim().length == 13) {
      return null;
    } else {
      return "please_enter_a_valid_card_number" ;
    }
  };
  static Function validateSecureCard = (String input) {
    if (input.isNotEmpty && input.trim().length == 4) {
      return null;
    } else {
      return "please_enter_a_valid_secure_code" ;
    }
  };

  // ignore: prefer_function_declarations_over_variables
  static Function validateConfirmPassword =
      (String? input, String newPassword) {
    // return "Password doesn't match";
    if (input.toString() == newPassword.toString()) {
      return null;
    } else {
      return "password_does_not_match_text" ;
    }
  };

  // ignore: prefer_function_declarations_over_variables
  static Function validateEmpty = (String? input) {
    if (  input == null  || input.isEmpty || input.trim().isEmpty) {
      return "The field is required" ;
    } else {
      return null;
    }
  };


  // ignore: prefer_function_declarations_over_variables
  static Function validateEmptyPassword = (String input) {
    if (input.isEmpty || input.trim().isEmpty) {
      return "password_requirement_text" ;
    } else {
      return null;
    }
  };

  // ignore: prefer_function_declarations_over_variables
  static Function validateAge = (String input) {
    if (input.isEmpty || input.trim().isEmpty) {
      return "the_field_is_required" ;
    } else if (isAdult(input)) {
      log("isAdult : ${isAdult(input)}");
      return null;
    } else {
      return "you_must_be_18_years" ;
    }
  };

  // // ignore: prefer_function_declarations_over_variables
  // static Function ignoreValidate = (String? input) {
  //   return null;
  // };

  // ignore: prefer_function_declarations_over_variables
  static Function validateList = (input) {
    if (input == null || input.length < 1) {
      return "Please Select Something";
    } else {
      return null;
    }
  };

  // ignore: prefer_function_declarations_over_variables
  static Function validateMobileNo = (String? input) {
    if (input == null || input.trim().length != 13) {
      return "Invalid Mobile Number";
    } else {
      return null;
    }
  };



  // ignore: prefer_function_declarations_over_variables
  static Function keepValidatorClean = (String input) {
    if (input.isEmpty || input.trim().isEmpty) {
      return null;
    } else {
      return null;
    }
  };
}

bool isAdult(String birthDateString) {
  log("input : $birthDateString");

  DateTime birthDate =
  DateFormatters.formatterMMMMDDYYYY.parse(birthDateString);
  log("birthDate : ${birthDate.year}");
  // DateTime birthDate = DateTime.parse();
  // DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
  DateTime today = DateTime.now();

  int yearDiff = today.year - birthDate.year;
  int monthDiff = today.month - birthDate.month;
  int dayDiff = today.day - birthDate.day;

  return yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0;
}