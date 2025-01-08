import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData? icon;
  final double? size;
  final Function()? onTap;
  const CustomIcon({super.key, required this.icon, this.onTap, this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: Icon(icon, size: size ?? 20));
  }
}
