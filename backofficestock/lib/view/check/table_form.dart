import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/editors/form_dropdown_field.dart';
import 'package:backofficestock/product/editors/form_text_field.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:backofficestock/view/form/widgets/form_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/check_order_widget.dart';

class TableForm extends StatelessWidget {
  final CheckProvider provider;
  const TableForm({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomExpanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FormLabel(text: "Table No"),
            FormTextField(name: "TableNo"),
            CustomSizedBox.paddingHeight(heightValue: 12.0),
            FormLabel(text: "Status"),
            FormDropdownField(
              fieldName: "Status",
              items: ["Active", "Reserved", "Deactive"],
            ),
            CustomSizedBox.paddingHeight(heightValue: 12.0),
            FormLabel(text: "Customer Name"),
            FormTextField(name: "CustomerName"),
            CustomSizedBox.paddingHeight(heightValue: 12.0),
            FormLabel(text: "Customer Count"),
            FormTextField(name: "CustomerCount"),
            CustomSizedBox.paddingHeight(heightValue: 12.0),
            FormLabel(text: "Special Text"),
            FormTextField(name: "SpecialText"),
          ]),
        ),
        const CustomSizedBox.paddingWidth(widthValue: 12.0),
        CustomExpanded(
          child: provider.selectedTable != null
              ? provider.selectedTable?.status == "Reserved" ||
                      provider.selectedTable?.status == "Deactive"
                  ? const Align(
                      alignment: Alignment.center,
                      child: Text("To add an order, activate the status."))
                  : const CheckOrder()
              : const SizedBox(),
        )
      ],
    );
  }
}
