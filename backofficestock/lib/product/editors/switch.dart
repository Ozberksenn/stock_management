import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      alignment: Alignment.bottomLeft,
      child: Switch(
        value: true,
        onChanged: (value) {},
        dragStartBehavior: DragStartBehavior.start,
      ),
    );
  }
}
