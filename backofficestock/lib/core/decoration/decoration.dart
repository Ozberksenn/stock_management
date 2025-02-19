import 'package:flutter/material.dart';

final class CustomDecoration {
  CustomDecoration._();
  static BoxDecoration circularImageDecoration(
          {double? borderRaius, required String imageUrl}) =>
      // fit parametre olarak gönderilebilir ?
      BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl)));

  static BoxDecoration radiusImageDecoration(ImageProvider<Object> image) =>
      BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(fit: BoxFit.cover, image: image));
}
