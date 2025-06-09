import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CheckEmptyTable extends StatelessWidget {
  const CheckEmptyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "There is no table. \n If you want to add a table please click the button below.",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const CustomSizedBox.paddingHeight(heightValue: 18.0),
          const CustomElevatedButton(text: "Add First Table")
        ]);
  }
}
