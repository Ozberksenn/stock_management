import 'package:flutter/material.dart';
import '../../../product/constants/api_constants.dart';
import '../../form/widgets/form_label.dart';

class CustomTextForm extends StatelessWidget {
  final FormFieldState<Map<String, dynamic>> field;
  final String fieldName;
  const CustomTextForm(
      {super.key, required this.field, required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabel(text: fieldName),
        TextFormField(
          decoration: const InputDecoration(),
          initialValue: field.value?[fieldName],
          style: AppFonts.inputStyle,
          onChanged: (val) {
            field.didChange({...field.value ?? {}, fieldName: val});
          },
        ),
      ],
    );
  }
}
