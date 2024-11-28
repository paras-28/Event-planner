import 'package:event_planner/core/utils/debug_logger.dart';

bool isListExist<T>(Iterable<T>? values) {
  if (values != null && values.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}


checkListLength<T>(Iterable<T>? values, {String? tag = "BEFORE"}) {
  if (values == null || values.isEmpty) {
    debuggerAdvance(
        tag: "$tag length of  ${T.toString()} list:", value: "[] or null");
  } else {
    debuggerAdvance(
        tag: "$tag length of  ${T.toString()} list:",
        value: values.length.toString());
  }
}

bool stringHasValue(String? value) {
  return value != null && value.isNotEmpty && value != "null";
}

bool intHaveValue(int? value) {
  return value != null;
}

/*
* USE CASE
 isListHaveLength(badgeModel.badgeResModel.badgeCategories)
* */