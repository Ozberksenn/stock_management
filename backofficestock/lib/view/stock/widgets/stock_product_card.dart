import 'package:backofficestock/product/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/padding.dart';
import '../../../core/widget/radius.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/widgets/custom_dialog.dart';

class StockProductCard extends StatelessWidget {
  const StockProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customDialog(context);
      },
      child: Container(
          margin: const ConstEdgeInsets.paddingOnly(right: 6.0),
          decoration: BoxDecoration(
              borderRadius: CustomRadius.radius8,
              color: AppColors.white,
              border: const Border(
                  left: BorderSide(width: 3, color: AppColors.primaryColor)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ]),
          padding: const ConstEdgeInsets.padding6(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(AppString.custumProductUrl))),
                  ),
                  const CustomSizedBox.paddingWidth(widthValue: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Name - 20TL',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text("Burada ürün ile ilgili açıklama yer alacak.",
                          style: AppFonts.greylabelSmall)
                    ],
                  )
                ],
              ),
              CustomPaddings.customPadding(
                  value: 6,
                  child: const CustomIconButton(
                    icon: CupertinoIcons.number_square,
                    text: '245',
                  ))
            ],
          )),
    );
  }
}
