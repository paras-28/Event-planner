import 'package:intl/intl.dart';

class DateFormatters {
  //9 June 2021: 15:00"
  static final DateFormat formatterForTimeHHMMA = DateFormat('hh:mm a');
  static final DateFormat formatterddMMYYYY = DateFormat('dd-MM-yyyy');
  static final DateFormat formatterYYYMMTHHSSZ =
  DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
  static final DateFormat formatterDateOnly =
  DateFormat("yyyy-MM-dd'T00:00:00Z'");
  static final DateFormat formatterDDMMYY = DateFormat('dd MMMM yyyy');
  static final DateFormat formatterDDMMYYHalfMonth = DateFormat('dd MMM yyyy');
  static final DateFormat formatterYYYYMMDay = DateFormat('yyyy-MM-dd');
  static final DateFormat formatForApi = DateFormat('yyyy-MM-dd');
  static final DateFormat formatterEEEE = DateFormat('EEEE,');
  static final DateFormat formatterMMMMDDYYYY = DateFormat('MM/dd/yyyy');

  // static final DateFormat formatterMMMMDDYYYY = DateFormat('dd/MM/yyyy');
  static final DateFormat formatterDDMMMMYYYYHHMM =
  DateFormat('dd MMMM yyyy, HH:mm');
  static final DateFormat fullDate = DateFormat('dd MMMM yyyy, HH:mm');
  static final DateFormat dateAtTransactionHistories = DateFormat('dd MMMM yyyy, HH:mm');
  static final DateFormat formatterMMDDYYYY = DateFormat('yyyy-dd-mm ');
  static final DateFormat formatterhhMMSS = DateFormat('hh:mm:ss');
  static final DateFormat formatterMMMMDDYYYYWithoutComma =
  DateFormat(' MMMM dd yyyy ');

  // format : Jue 14 2021 8:35AM
  static String dateProvider(data) {
    // print("@  => ${data}");
    final firstString =
    DateFormatters.formatterMMMMDDYYYYWithoutComma.format(data);
    final lastString = DateFormatters.formatterForTimeHHMMA.format(data);
    return "$firstString  $lastString";
    // return "${firstString}   ${lastString}";
  }
// format : Jue 14 2021 8:35AM
}