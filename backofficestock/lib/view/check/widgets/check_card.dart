import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/view/check/model/table_model.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/api_constants.dart';

class CheckCard extends StatelessWidget {
  final TableModel? table;
  const CheckCard({super.key, required this.table});

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
          Text("Masa No : ${table?.tableNo}", style: AppFonts.boldSmall),
          Text("Status : ${table?.status}",
              style: Theme.of(context).textTheme.bodySmall),
          Text("Products :", style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}
