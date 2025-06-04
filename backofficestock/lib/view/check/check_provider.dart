import 'package:flutter/material.dart';

class CheckProvider extends ChangeNotifier {
  CheckProvider() {
    onInit();
  }

  void onInit() {
    print("Hello Check Provider");
  }
}
