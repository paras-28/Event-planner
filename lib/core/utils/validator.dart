class Validator {
  Validator._();

  // ignore: prefer_function_declarations_over_variables
  static Function validateEmpty = (String? input) {
    if (input == null || input.isEmpty || input.trim().isEmpty) {
      return "The field is required";
    } else {
      return null;
    }
  };

  // ignore: prefer_function_declarations_over_variables
  static Function validateList = (input) {
    if (input == null || input.length < 1) {
      return "List is empty";
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
