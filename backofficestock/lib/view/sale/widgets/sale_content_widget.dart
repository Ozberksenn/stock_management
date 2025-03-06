import 'package:backofficestock/product/editors/form_text_field.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/product/widgets/custom_icon_button.dart';
import 'package:backofficestock/view/sale/sale_provider.dart';
import 'package:backofficestock/view/sale/widgets/no_product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/padding.dart';
import 'sale_product_card_widget.dart';

class SaleContent extends StatelessWidget {
  const SaleContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SaleProvider provider = context.watch<SaleProvider>();
    return CustomExpanded(
        flex: 1,
        child: Padding(
          padding: const ConstEdgeInsets.padding8(),
          child: Column(
            children: [
              const CustomSizedBox.paddingHeight(heightValue: 8.0),
              Row(children: [
                const CustomIconButton(icon: Iconsax.filter),
                const CustomSizedBox.paddingWidth(widthValue: 12.0),
                Expanded(
                  child: FormTextField(
                    name: "",
                    onSubmitted: (v) => provider.searchBarcode(),
                    hintText: "Barcode No",
                    textEditingController: provider.barcodeTextController,
                  ),
                ),
                const CustomSizedBox.paddingWidth(widthValue: 12.0),
                CustomIcon(
                  icon: CupertinoIcons.search,
                  onTap: () => provider.searchBarcode(),
                )
              ]),
              const CustomSizedBox.paddingHeight(heightValue: 30.0),
              provider.isReady == true
                  ? CustomExpanded(child: SaleProductCard(provider: provider))
                  : const NoProductWidget()
            ],
          ),
        ));
  }
}
