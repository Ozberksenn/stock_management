import 'package:flutter/material.dart';
import '../../core/widget/padding.dart';
import '../../core/widget/radius.dart';
import '../constants/api_constants.dart';
import 'custom_icon.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String? text;
  final void Function()? onTap;
  const CustomIconButton(
      {super.key, required this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.grey, borderRadius: CustomRadius.radius8),
          padding: const ConstEdgeInsets.padding6(),
          child: Row(
            children: [
              CustomIcon(
                icon: icon,
                color: AppColors.black,
                size: 16,
              ),
              const CustomSizedBox.paddingWidth(widthValue: 4.0),
              text != null
                  ? Text(
                      text ?? "",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  : const SizedBox(),
            ],
          )),
    );
  }
}
