import 'package:flutter/cupertino.dart';
import '../../core/widget/padding.dart';
import '../../core/widget/radius.dart';
import '../constants/api_constants.dart';
import 'custom_icon.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.grey, borderRadius: CustomRadius.radius8),
        padding: const ConstEdgeInsets.padding6(),
        child: const CustomIcon(
          icon: CupertinoIcons.add,
          color: AppColors.black,
          size: 16,
        ));
  }
}
