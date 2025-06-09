import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

import '../constants/api_constants.dart';

class FormDropdownField extends StatelessWidget {
  final List<dynamic>? items;
  final String fieldName;
  final bool? showSearchBox;
  final String? hintText;
  const FormDropdownField(
      {super.key,
      this.items,
      required this.fieldName,
      this.showSearchBox,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: FormBuilderSearchableDropdown<String>(
        popupProps: PopupProps.menu(
          showSearchBox: showSearchBox ?? false,
          constraints: const BoxConstraints(
            maxHeight: 200,
          ),
        ),
        name: fieldName,
        items:
            items != null ? items!.map((item) => item.toString()).toList() : [],
        dropdownSearchTextStyle:
            const TextStyle(fontSize: 12, color: AppColors.dark),
        dropdownButtonProps: const DropdownButtonProps(
          icon: Icon(Icons
              .arrow_drop_down_rounded), // ← Burayı istediğin ikonla değiştir
          iconSize: 20,
        ),
        decoration: InputDecoration(hintText: hintText ?? ""),
        // onChanged: _onChanged,
        filterFn: (item, filter) =>
            item.toLowerCase().contains(filter.toLowerCase()),
      ),
    );
  }
}
