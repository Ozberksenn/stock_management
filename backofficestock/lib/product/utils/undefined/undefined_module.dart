import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/cupertino.dart';

class UndefinedModule extends StatelessWidget {
  final String? message;
  const UndefinedModule({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/not_module.png",
              width: context.dynamicWidth(0.4),
              height: context.dynamicHeight(0.3)),
          const CustomSizedBox.paddingHeight(heightValue: 24.0),
          Text(message ?? "", style: AppFonts.greyBodyMedium)
        ]);
  }
}
