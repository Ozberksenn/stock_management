import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormRadioGroup extends StatelessWidget {
  final String name;
  final void Function(String?)? onChanged;
  final List<String>? options;
  const FormRadioGroup(
      {super.key, required this.name, this.onChanged, this.options});

  @override
  Widget build(BuildContext context) {
    return FormBuilderRadioGroup<String>(
      decoration: const InputDecoration(
        labelText: 'My chosen language',
      ),
      initialValue: null,
      name: name,
      onChanged: onChanged,
      options: options != null
          ? options!
              .map((value) => FormBuilderFieldOption(
                    value: value,
                    child: Text(
                      value,
                      style: AppFonts.inputStyle,
                    ),
                  ))
              .toList(growable: false)
          : [],
      controlAffinity: ControlAffinity.trailing,
    );
  }
}
