import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../product/widgets/custom_icon.dart';

class FormTitle extends StatelessWidget {
  final String? title;
  const FormTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          CustomIcon(
              icon: CupertinoIcons.xmark,
              onTap: () => GoRouter.of(context).pop())
        ],
      ),
    );
  }
}
