import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;
  const SwitchWidget({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      alignment: Alignment.bottomLeft,
      child: Switch(
        value: value,
        onChanged: onChanged,
        dragStartBehavior: DragStartBehavior.start,
      ),
    );
  }
}
