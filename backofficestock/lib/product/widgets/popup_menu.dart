import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:flutter/material.dart';

PopupMenuButton<dynamic> popupMenu(
    {Widget? widget, required List<PopupMenuItem> items}) {
  return PopupMenuButton(
      padding: const EdgeInsets.all(0),
      color: AppColors.white,
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      position: PopupMenuPosition.under,
      tooltip: '',
      child: widget,
      itemBuilder: (context) => items);
}

PopupMenuItem<dynamic> popupItem(
    {String? name, IconData? icon, dynamic onTap}) {
  return PopupMenuItem(
    value: name,
    onTap: onTap,
    child: Text(
      name ?? '',
    ),
  );
}
