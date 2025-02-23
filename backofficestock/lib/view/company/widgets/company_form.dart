import 'package:flutter/material.dart';

import '../../../core/widget/padding.dart';
import '../../../product/editors/form_text_field.dart';
import '../../form/widgets/form_card.dart';
import '../../form/widgets/form_label.dart';

class CompanyForm extends StatelessWidget {
  const CompanyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormCard(
            title: "General Information",
            widget: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox.paddingHeight(heightValue: 8.0),
                  FormLabel(text: "Company Name"),
                  FormTextField(name: "COMPANYNAME"),
                  CustomSizedBox.paddingHeight(heightValue: 8.0),
                  FormLabel(text: "Logo Url"),
                  FormTextField(name: "LOGOURL"),
                  CustomSizedBox.paddingHeight(heightValue: 8.0),
                  FormLabel(text: "QR Url"),
                  FormTextField(name: "QRURL"),
                  CustomSizedBox.paddingHeight(heightValue: 8.0),
                ],
              )
            ],
          ),
          FormCard(
            title: "Contact Info",
            widget: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomSizedBox.paddingHeight(heightValue: 8.0),
                FormLabel(text: "Address"),
                FormTextField(name: "ADDRESS"),
                CustomSizedBox.paddingHeight(heightValue: 8.0),
                FormLabel(text: "Phone"),
                FormTextField(name: "PHONE"),
                CustomSizedBox.paddingHeight(heightValue: 8.0),
                FormLabel(text: "MAIL"),
                FormTextField(name: "MAIL"),
                CustomSizedBox.paddingHeight(heightValue: 8.0),
              ])
            ],
          ),
          FormCard(
            title: "Socail Media Informations",
            widget: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox.paddingHeight(heightValue: 8.0),
                  FormLabel(text: "Instagram"),
                  FormTextField(name: "INSTAGRAM"),
                  CustomSizedBox.paddingHeight(heightValue: 8.0),
                  FormLabel(text: "X"),
                  FormTextField(name: "X"),
                  CustomSizedBox.paddingHeight(heightValue: 8.0),
                  FormLabel(text: "Youtube"),
                  FormTextField(name: "YOUTUBE"),
                  CustomSizedBox.paddingHeight(heightValue: 8.0),
                  FormLabel(text: "Facebook"),
                  FormTextField(name: "FACEBOOK"),
                ],
              )
            ],
          ),
          FormCard(
            title: "Working Days and Hours",
            widget: [],
          )
        ]);
  }
}
