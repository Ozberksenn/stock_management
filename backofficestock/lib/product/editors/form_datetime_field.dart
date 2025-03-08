import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormDateTime extends StatelessWidget {
  final String name;
  final DatePickerEntryMode? initialEntryMode;
  final InputType? inputType;
  const FormDateTime(
      {super.key, required this.name, this.initialEntryMode, this.inputType});

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      initialEntryMode: initialEntryMode ?? DatePickerEntryMode.calendar,
      initialValue: DateTime.now(),
      style: AppFonts.inputStyle,
      inputType: inputType ?? InputType.date,
      initialTime: const TimeOfDay(hour: 8, minute: 0),
      // locale: const Locale.fromSubtags(languageCode: 'fr'),
    );
  }
}
