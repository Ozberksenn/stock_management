import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/api_constants.dart';
import '../../../product/widgets/custom_icon.dart';

class ExcellCardWidget extends StatelessWidget {
  const ExcellCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.softGrey,
      child: ListTile(
        title: Text(
          "Qritically Stock Quantitiy Reports",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          "You should download that you can see this excel file.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: const CustomIcon(icon: CupertinoIcons.download_circle),
      ),
    );
  }
}
