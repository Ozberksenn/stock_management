import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';
import '../../../product/widgets/custom_icon_button.dart';
import '../../../product/widgets/search_field.dart';

class ContentHeader extends StatelessWidget {
  final String title;
  const ContentHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Row(children: [
          CustomIconButton(),
          CustomSizedBox.paddingWidth(widthValue: 8.0),
          SearchField()
        ])
      ],
    );
  }
}
