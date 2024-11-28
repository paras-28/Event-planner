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
      firstDate: DateTime.now(),
      lastDate: isLastDateIsCurrentDay ? currentSelectedState
          : DateTime(currentSelectedState.year+100),);
  if (picked != null && picked != selectedDate) {
    onDateSelect(picked);
  }
}


Future<DateTime?> showDateTimePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  initialDate ??= DateTime.now();
  firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
  lastDate ??= firstDate.add(const Duration(days: 365 * 200));

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );

  if (selectedDate == null) return null;

  if (!context.mounted) return selectedDate;

  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(initialDate),
  );

  return selectedTime == null
      ? selectedDate
      : DateTime(
    selectedDate.year,
    selectedDate.month,
    selectedDate.day,
    selectedTime.hour,
    selectedTime.minute,
  );
}