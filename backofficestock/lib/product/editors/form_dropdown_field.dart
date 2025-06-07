import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

class FormDropdownField extends StatelessWidget {
  final List<dynamic>? items;
  final String fieldName;
  final bool? showSearchBox;
  const FormDropdownField(
      {super.key, this.items, required this.fieldName, this.showSearchBox});

  @override
  Widget build(BuildContext context) {
    return FormBuilderSearchableDropdown<String>(
      popupProps: PopupProps.menu(showSearchBox: showSearchBox ?? false),
      name: fieldName,
      items:
          items != null ? items!.map((item) => item.toString()).toList() : [],
      // onChanged: _onChanged,
      // decoration:
      //     const InputDecoration(labelText: 'Searchable Dropdown Offline'),
      filterFn: (item, filter) =>
          item.toLowerCase().contains(filter.toLowerCase()),
    );
  }
}
