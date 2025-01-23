import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/editors/form_text_field.dart';
import 'package:backofficestock/view/form/widgets/form_label.dart';
import 'package:flutter/material.dart';

class MenuForm extends StatelessWidget {
  const MenuForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabel(text: "Menu Name"),
          FormTextField(name: "MENUNAME"),
          CustomSizedBox.paddingHeight(heightValue: 10),
          FormLabel(text: "Menu Description"),
          FormTextField(name: "MENUDESCRIPTION"),
          CustomSizedBox.paddingHeight(heightValue: 10),
          FormLabel(text: "Menu Image"),
          FormTextField(name: "MENUIMAGE"),
        ]);
  }
}
