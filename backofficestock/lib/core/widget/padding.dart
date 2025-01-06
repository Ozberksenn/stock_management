import 'package:flutter/material.dart';

final class CustomPaddings {
  CustomPaddings._();
  static Padding customPadding({required double value, Widget? child}) =>
      Padding(padding: EdgeInsets.all(value), child: child);

  static const Padding padding8 = Padding(padding: ConstEdgeInsets.padding8());
}

@immutable
final class ConstEdgeInsets extends EdgeInsets {
  const ConstEdgeInsets.padding20() : super.all(20);
  const ConstEdgeInsets.padding16() : super.all(16);
  const ConstEdgeInsets.padding12() : super.all(12);
  const ConstEdgeInsets.padding8() : super.all(8);
  const ConstEdgeInsets.padding4() : super.all(4);
  const ConstEdgeInsets.padding2() : super.all(2);
  const ConstEdgeInsets.padding0() : super.all(0);
  const ConstEdgeInsets.paddingHorizontal6() : super.symmetric(horizontal: 6);
  const ConstEdgeInsets.paddingHorizontal12() : super.symmetric(horizontal: 12);

  const ConstEdgeInsets.paddingSymetric(
      {double? horizontalPad, double? verticalPad})
      : super.symmetric(
            horizontal: horizontalPad ?? 0, vertical: verticalPad ?? 0);
}

@immutable
final class CustomSizedBox extends SizedBox {
  const CustomSizedBox.paddingHeight({super.key, required double heightValue})
      : super(height: heightValue);
  const CustomSizedBox.paddingWidth({super.key, required double widthValue})
      : super(width: widthValue);
}

@immutable
final class CustomExpanded extends Expanded {
  const CustomExpanded({super.key, super.flex, Widget? child})
      : super(child: child ?? const SizedBox());
}
