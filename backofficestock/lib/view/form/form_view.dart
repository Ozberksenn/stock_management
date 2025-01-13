import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'widgets/form_footer.dart';
import 'widgets/form_title_widget.dart';

class FormView extends StatelessWidget {
  final String? title;
  final String? route;
  FormView({super.key, this.title, this.route});
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Stack(children: [
        SizedBox(
          child: Column(
            children: [
              FormTitle(title: title),
              const Divider(),
              body(route ?? '')
            ],
          ),
        ),
        const FormFooter()
      ]),
    );
  }
}

body(String formName) {
  switch (formName) {
    case '':
      return const SizedBox();
    default:
  }
}
