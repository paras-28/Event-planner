bool isListExist<T>(Iterable<T>? values) {
  if (values != null && values.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

/*
* USE CASE
 isListHaveLength(badgeModel.badgeResModel.badgeCategories)
* */