import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';
import '../../../product/widgets/search_field.dart';

class ContentHeader extends StatelessWidget {
  final String title;
  final Widget? widget;
  final bool? searchBar;
  const ContentHeader(
      {super.key, required this.title, this.widget, this.searchBar});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(children: [
          widget ?? const SizedBox(),
          const CustomSizedBox.paddingWidth(widthValue: 8.0),
          searchBar != false ? const SearchField() : const SizedBox()
        ])
      ],
    );
  }
}
