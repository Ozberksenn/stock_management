import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/form/form_provider.dart';
import 'package:backofficestock/view/stock/stock_form/menu_form.dart';
import 'package:backofficestock/view/stock/stock_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'widgets/form_footer.dart';
import 'widgets/form_title_widget.dart';

class FormView extends StatelessWidget {
  final BuildContext dialogContext;
  final String? title;
  final String? route;
  final String? apiUrl;
  FormView({
    super.key,
    this.title,
    this.route,
    required this.dialogContext,
    this.apiUrl,
  });
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormProvider(),
      builder: (context, child) {
        FormProvider formProvider = context.read();
        StockProvider stockProvider = dialogContext.read<StockProvider>();
        return FormBuilder(
          key: _formKey,
          initialValue: stockProvider.selectedTab?.toJson() ?? {},
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormTitle(title: title),
                const Divider(),
                CustomPaddings.customPadding(
                    value: 12.0, child: body(route ?? ''))
              ],
            ),
            FormFooter(
                onTap: () => formProvider.handleSaveButton(_formKey, apiUrl))
          ]),
        );
      },
    );
  }
}

body(String formName) {
  switch (formName) {
    case 'menu':
      return const MenuForm();
    default:
  }
}
