import 'package:flutter/material.dart';

import 'app_colors.dart';

Future<void> appDatePicker({
  required BuildContext context , required DateTime selectedDate ,
 required Function(DateTime) onDateSelect,
bool isLastDateIsCurrentDay = true}
    ) async {
  DateTime currentSelectedState = DateTime.now();
  final DateTime? picked = await showDatePicker(
    builder: (context, Widget? child)
    {
      return Theme(data: ThemeData.light().copyWith(
        colorScheme:  const ColorScheme.light(
          primary: AppColors.primaryColor, // header background color
          onPrimary: Colors.white, // header text color
          onSurface: Colors.black, // body text color
        ),
      ),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 50),
                  height: 650,
                  width: 450,
                  // padding: EdgeInsets.symmetric(horizontal: 600,vertical: 100),
                  child: child!),
            ],
          ));
    },
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(currentSelectedState.year-100),
      lastDate: isLastDateIsCurrentDay ? currentSelectedState
          : DateTime(currentSelectedState.year+100),);
  if (picked != null && picked != selectedDate) {
    onDateSelect(picked);
  }
}
