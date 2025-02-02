import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/widgets/snackbar_widgets.dart';
import 'package:backofficestock/view/form/form_provider.dart';
import 'package:backofficestock/view/stock/stock_form/menu_form.dart';
import 'package:backofficestock/view/stock/stock_form/product_form.dart';
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
  final bool? edit;
  Map<String, dynamic>? initialValue;
  final Map<String, dynamic>? parameters;
  FormView(
      {super.key,
      this.title,
      this.route,
      required this.dialogContext,
      this.apiUrl,
      this.initialValue,
      this.parameters,
      this.edit});
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormProvider(),
      builder: (context, child) {
        FormProvider formProvider = context.read();
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
                    value: 12.0, child: body(route ?? ''))
              ],
            ),
            FormFooter(onTap: () async {
              if (edit == true) {
                ServiceResponse result = await formProvider.handleSaveButton(
                    formKey: _formKey,
                    url: apiUrl!,
                    edit: true,
                    parameters: parameters);
                if (result.isSuccess == true) {
                  successSnackbar(
                      context: context, message: "Success Updated Form");
                } else {
                  errorSnackbar(context: context, message: "Error");
                }
              } else {
                ServiceResponse result = await formProvider.handleSaveButton(
                    formKey: _formKey,
                    url: apiUrl!,
                    edit: false,
                    parameters: parameters);
                if (result.isSuccess == true) {
                  successSnackbar(
                      context: context, message: "Success Add Form");
                } else {
                  errorSnackbar(context: context, message: "Error");
                }
              }
            })
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
    case 'product':
      return const ProductForm();
    default:
      return const SizedBox();
  }
}
