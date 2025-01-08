import 'package:flutter/material.dart';

class StockProvider extends ChangeNotifier {
  late TabController tabController;
  StockProvider(TickerProvider vsync) {
    init(vsync);
  }

  void init(TickerProvider vsync) {
    tabController = TabController(length: 7, vsync: vsync);
  }
}
