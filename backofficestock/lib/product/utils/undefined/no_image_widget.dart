import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NoImage extends StatelessWidget {
  final double? width;
  final double? height;
  final double? size;

  const NoImage({super.key, this.width, this.height, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: CustomRadius.radius16),
      child: CustomIcon(
        icon: Iconsax.image,
        size: size ?? 100,
      ),
    );
  }
}
