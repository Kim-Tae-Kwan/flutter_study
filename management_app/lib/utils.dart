import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:management_app/BaseModel.dart';

Directory? docsDir;

Future<String?> selectDate({required BuildContext context, required BaseModel inModel, String? inDateString}) async {
  DateTime initialDate = DateTime.now();

  if (inDateString != null) {
    List<String> dateParts = inDateString.split(',');
    initialDate = DateTime(
      int.parse(dateParts[0]),
      int.parse(dateParts[1]),
      int.parse(dateParts[2]),
    );
  }

  DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100)
  );

  if(picked != null){
    inModel.setChosenDate(DateFormat.yMMMd('en_US').format(picked.toLocal()));
    return '${picked.year},${picked.month},${picked.day}';
  }

  return null;
}