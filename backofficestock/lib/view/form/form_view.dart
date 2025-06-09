import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/check/table_form.dart';
import 'package:backofficestock/view/form/form_provider.dart';
import 'package:backofficestock/view/stock/stock_form/menu_form.dart';
import 'package:backofficestock/view/stock/stock_form/product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'widgets/form_footer.dart';
import 'widgets/form_title_widget.dart';

class FormView<T extends ChangeNotifier> extends StatelessWidget {
  final BuildContext dialogContext;
  final String? title;
  final String?
      route; // menu mu product mı vs ona göre formu basıyor ve image field alanını ayarlıyor.
  final String? apiUrl;
  final T provider;
  final bool? edit;
  final Map<String, dynamic>? initialValue;
  final Map<String, dynamic>? parameters;
  FormView(
      {super.key,
      this.title,
      this.route,
      required this.dialogContext,
      this.apiUrl,
      this.initialValue,
      this.parameters,
      required this.provider,
      this.edit});
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    FormProvider formProvider = context.watch<FormProvider>();

    return FormBuilder(
      key: _formKey,
      initialValue: initialValue ?? {},
      child: Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormTitle(title: title),
            const Divider(),
            CustomPaddings.customPadding(
                value: 12.0, child: body(route ?? '', provider, initialValue))
          ],
        ),
        FormFooter(
            formProvider: formProvider,
            onTap: () {
              if (edit == true) {
                formProvider.handleSaveButton<T>(
                    formName: route,
                    context: context,
                    formKey: _formKey,
                    url: apiUrl!,
                    edit: true,
                    provider: provider,
                    parameters: parameters);
              } else {
                formProvider.handleSaveButton<T>(
                    formName: route,
                    context: context,
                    formKey: _formKey,
                    url: apiUrl!,
                    edit: false,
                    provider: provider,
                    parameters: parameters);
              }
            })
      ]),
    );
  }
}

body(String formName, provider, initialValue) {
  switch (formName) {
    case 'menu':
      return MenuForm(
        provider: provider,
      );
    case 'product':
      return ProductForm(
        initialValue: initialValue,
      );
    case 'table':
      return TableForm(
        provider: provider,
      );
    default:
      return const SizedBox();
  }
}
