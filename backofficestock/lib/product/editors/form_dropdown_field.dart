import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

class FormDropdownField extends StatelessWidget {
  final String fieldName;
  const FormDropdownField({super.key, required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return FormBuilderSearchableDropdown<String>(
      popupProps: const PopupProps.menu(showSearchBox: true),
      name: fieldName,
      // items: allCountries,
      // onChanged: _onChanged,
      // decoration:
      //     const InputDecoration(labelText: 'Searchable Dropdown Offline'),
      filterFn: (country, filter) =>
          country.toLowerCase().contains(filter.toLowerCase()),
    );
  }
}
