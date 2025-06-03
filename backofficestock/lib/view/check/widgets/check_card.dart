import 'package:backofficestock/core/widget/padding.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/api_constants.dart';

class CheckCard extends StatelessWidget {
  const CheckCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const ConstEdgeInsets.padding4(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Masa No : 15", style: AppFonts.boldSmall),
          Text("Status : Açık", style: Theme.of(context).textTheme.bodySmall),
          Text("Products :", style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}
