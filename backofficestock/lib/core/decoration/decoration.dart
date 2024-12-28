import 'package:flutter/material.dart';

final class CustomDecoration {
  CustomDecoration._();
  static BoxDecoration imageDecoration(
          {double? borderRaius, required String imageUrl}) =>
      // fit parametre olarak gönderilebilir ?
      BoxDecoration(
          borderRadius: BorderRadius.circular(borderRaius ?? 0),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl)));
}
