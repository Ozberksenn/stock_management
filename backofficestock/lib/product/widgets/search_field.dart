import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_icon.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.dynamicWidth(0.2),
        child: TextFormField(
          decoration: const InputDecoration(
              hintText: 'Search',
              prefixIconConstraints:
                  BoxConstraints(minHeight: 10, minWidth: 40),
              prefixIcon: CustomIcon(
                icon: CupertinoIcons.search,
                size: 18,
                color: AppColors.primaryColor,
              )),
        ));
  }
}
