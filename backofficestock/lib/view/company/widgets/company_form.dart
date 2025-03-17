import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:backofficestock/view/company/widgets/social_media_field.dart';
import 'package:backofficestock/view/company/widgets/working_days_field.dart';
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
              FormTextField(name: "LOGO"),
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
            children: [WorkingDaysField()],
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
            children: [SocialMediaField()],
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
            onTap: () => provider.handleSendButton(formKey, context),
          ),
        )
      ]),
    );
  }
}

class CircleButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  const CircleButton({super.key, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onTap,
        shape: const CircleBorder(),
        backgroundColor: color ?? AppColors.blue,
        child: const CustomIcon(
          icon: CupertinoIcons.check_mark,
          color: AppColors.white,
          size: 25,
        ));
  }
}
