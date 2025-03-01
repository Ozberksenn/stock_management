import 'package:flutter/material.dart';

import '../../core/widget/padding.dart';
import 'form_text_field.dart';

class FormMultiText extends StatelessWidget {
  const FormMultiText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomExpanded(
            flex: 3,
            child: FormTextField(
              name: "MONDAYSTART",
              initialValue: "Pazartesi",
              hintText: "Day",
            )),
        CustomSizedBox.paddingWidth(widthValue: 12.0),
        CustomExpanded(
            child: FormTextField(
          name: "",
          hintText: "Time",
        )),
      ],
    );
  }
}
