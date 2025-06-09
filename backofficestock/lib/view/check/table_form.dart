import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/editors/form_dropdown_field.dart';
import 'package:backofficestock/product/editors/form_text_field.dart';
import 'package:backofficestock/view/form/widgets/form_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/check_order_widget.dart';

class TableForm extends StatelessWidget {
  const TableForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomExpanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FormLabel(text: "Table No"),
            FormTextField(name: "TABLE_NO"),
            CustomSizedBox.paddingHeight(heightValue: 12.0),
            FormLabel(text: "Status"),
            FormDropdownField(
              fieldName: "STATUS",
              items: ["Active", "Reserved", "Deactive"],
            ),
            CustomSizedBox.paddingHeight(heightValue: 12.0),
            FormLabel(text: "Customer Name"),
            FormTextField(name: "CUSTOMER_NAME"),
            CustomSizedBox.paddingHeight(heightValue: 12.0),
            FormLabel(text: "Customer Count"),
            FormTextField(name: "CUSTOMER_COUNT"),
            CustomSizedBox.paddingHeight(heightValue: 12.0),
            FormLabel(text: "Special Text"),
            FormTextField(name: "SPECIAL_TEXT"),
          ]),
        ),
        CustomSizedBox.paddingWidth(widthValue: 12.0),
        CustomExpanded(
          child: CheckOrder(),
        )
      ],
    );
  }
}
