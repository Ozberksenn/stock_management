import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/editors/form_checkbox_field.dart';
import 'package:backofficestock/product/editors/form_image_picker_field.dart';
import 'package:backofficestock/product/editors/form_text_field.dart';
import 'package:backofficestock/view/form/widgets/form_label.dart';
import 'package:backofficestock/view/stock/stock_provider.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MenuForm extends StatelessWidget {
  final StockProvider provider;
  const MenuForm({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormImagePicker(initialValue: provider.selectedTab?.menuImage ?? ""),
          const CustomSizedBox.paddingWidth(widthValue: 16.0),
          const FormLabel(text: "Menu Name"),
          FormTextField(
              name: "MENUNAME", validator: FormBuilderValidators.required()),
          const CustomSizedBox.paddingHeight(heightValue: 8),
          const FormLabel(text: "Menu Description"),
          const FormTextField(
            name: "MENUDESCRIPTION",
            maxLines: 3,
          ),
          const FormCheckboxField(
            name: "SHOWSTORE",
            text: "Show Store",
          ),
          const CustomSizedBox.paddingHeight(heightValue: 16),
        ]);
  }
}
