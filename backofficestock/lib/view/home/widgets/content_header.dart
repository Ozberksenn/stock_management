import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/widgets/custom_dialog.dart';
import 'package:backofficestock/view/form/form_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../product/widgets/custom_icon_button.dart';
import '../../../product/widgets/popup_menu.dart';
import '../../../product/widgets/search_field.dart';

class ContentHeader extends StatelessWidget {
  final String title;
  const ContentHeader({super.key, required this.title});

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
          popupMenu(
              widget: const CustomIconButton(
                icon: CupertinoIcons.add,
                text: 'Add',
              ),
              items: [
                PopupMenuItem(
                    onTap: () => customDialog(context,
                        widget: FormView(
                            dialogContext: context,
                            apiUrl: "/postMenu",
                            edit: false,
                            title: "Add Menu",
                            route: "menu")),
                    child: const Text('Add Menu')),
                PopupMenuItem(onTap: () {}, child: const Text('Add Product'))
              ]),
          const CustomSizedBox.paddingWidth(widthValue: 8.0),
          const SearchField()
        ])
      ],
    );
  }
}
