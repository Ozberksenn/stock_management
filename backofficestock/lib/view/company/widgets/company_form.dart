import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../core/widget/padding.dart';
import '../../../product/editors/form_text_field.dart';
import '../../form/widgets/form_card.dart';
import '../../form/widgets/form_label.dart';

class CompanyForm extends StatelessWidget {
  final CompanyProvider provider;
  CompanyForm({
    super.key,
    required this.provider,
  });
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    FormCard generalInformation() {
      return const FormCard(
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
      );
    }

    FormCard contactInformation() {
      return const FormCard(
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
            FormLabel(text: "Contact Mail"),
            FormTextField(name: "CONTACTMAIL"),
            CustomSizedBox.paddingHeight(heightValue: 8.0),
          ])
        ],
      );
    }

    FormCard workingDaysInformation() {
      return const FormCard(
        title: "Working Days and Hours",
        widget: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormLabel(text: "Working Days"),
              FormTextField(name: "WORKINGDAYS", maxLines: 4),
            ],
          )
        ],
      );
    }

    FormCard socialMediaInformation() {
      return const FormCard(
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
      );
    }

    return FormBuilder(
      key: formKey,
      initialValue: provider.companyInfo,
      child: Stack(children: [
        ListView(children: [
          generalInformation(),
          contactInformation(),
          socialMediaInformation(),
          workingDaysInformation()
        ]),
        Positioned(
          right: 0,
          bottom: 0,
          child: CircleButton(
            onTap: () => provider.handleSendButton(formKey),
          ),
        )
      ]),
    );
  }
}

class CircleButton extends StatelessWidget {
  final void Function()? onTap;
  const CircleButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onTap,
        shape: const CircleBorder(),
        backgroundColor: AppColors.blue,
        child: const CustomIcon(
          icon: CupertinoIcons.check_mark,
          color: AppColors.white,
          size: 25,
        ));
  }
}
