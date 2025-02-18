import 'package:backofficestock/product/editors/form_text_field.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/padding.dart';

class SaleContent extends StatelessWidget {
  const SaleContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpanded(
        flex: 2,
        child: Padding(
          padding: ConstEdgeInsets.padding8(),
          child: Column(
            children: [
              FormTextField(
                name: "",
                hintText: "Barcode No",
              )
            ],
          ),
        ));
  }
}
