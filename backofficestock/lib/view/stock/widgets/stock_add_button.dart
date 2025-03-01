import 'package:flutter/material.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/utils/modal/custom_dialog.dart';
import '../../../product/widgets/custom_elevated_button.dart';
import '../../../product/widgets/popup_menu.dart';
import '../../form/form_view.dart';
import '../stock_provider.dart';

class StockAddButton extends StatelessWidget {
  final StockProvider stockProvider;
  const StockAddButton({super.key, required this.stockProvider});

  @override
  Widget build(BuildContext context) {
    return popupMenu(
        widget: CustomElevatedButton(
          text: "+ Add",
          color: AppColors.dark,
          style: AppFonts.whiteBodyMedium,
        ),
        items: [
          popupItem(
            name: "Menu",
            onTap: () => customDialog(context,
                widget: FormView(
                    dialogContext: context,
                    apiUrl: "/postMenu",
                    edit: false,
                    title: "Add Menu",
                    provider: stockProvider,
                    route: "menu")),
          ),
          popupItem(
            name: "Product",
            onTap: () => customDialog(context,
                widget: FormView<StockProvider>(
                  dialogContext: context,
                  apiUrl: "/createProducts",
                  edit: false,
                  title: "Add Product",
                  route: "product",
                  provider: stockProvider,
                  parameters: {"MENUID": stockProvider.selectedTab?.menuId},
                )),
          )
        ]);
  }
}
