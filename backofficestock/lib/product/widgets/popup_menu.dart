import 'package:flutter/material.dart';

PopupMenuButton<dynamic> popupMenu({
  Widget? widget,
  List<PopupMenuEntry<dynamic>>? items,
}) {
  return PopupMenuButton(
    position: PopupMenuPosition.under,
    tooltip: '',
    child: widget,
    itemBuilder: (context) => (items ?? [])
        .map((e) => PopupMenuItem(child: e)) // e'yi doğrudan kullan
        .toList(),
  );
}
