import 'package:flutter/material.dart';

import '../../../core/widget/padding.dart';
import '../../../product/utils/undefined/no_item_widget.dart';
import '../company_provider.dart';
import '../widgets/company_form.dart';

class Company extends StatelessWidget {
  final CompanyProvider provider;
  const Company({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return CustomExpanded(
        child: provider.isReady == true
            ? CompanyForm(
                provider: provider,
              )
            : const NoItemWidget());
  }
}
