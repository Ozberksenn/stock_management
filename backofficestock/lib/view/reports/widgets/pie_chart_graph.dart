import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartGraph extends StatelessWidget {
  const PieChartGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 350,
      child: PieChart(
        PieChartData(
            sectionsSpace: 5,
            centerSpaceRadius: 50,
            startDegreeOffset: 200,
            sections: _getPieSections()),
      ),
    );
  }
}

List<PieChartSectionData> _getPieSections() {
  return [
    PieChartSectionData(
      value: 40,
      title: 'Ürün A\n40%',
      color: Colors.blue,
      radius: 100,
      titleStyle: TextStyle(fontSize: 14, color: Colors.white),
    ),
    PieChartSectionData(
      value: 30,
      title: 'Ürün B\n30%',
      color: Colors.red,
      radius: 100,
      titleStyle: TextStyle(fontSize: 14, color: Colors.white),
    ),
    PieChartSectionData(
      value: 20,
      title: 'Ürün C\n20%',
      color: Colors.green,
      radius: 100,
      titleStyle: TextStyle(fontSize: 14, color: Colors.white),
    ),
    PieChartSectionData(
      value: 10,
      title: 'Ürün D\n10%',
      color: Colors.orange,
      radius: 100,
      titleStyle: TextStyle(fontSize: 14, color: Colors.white),
    ),
  ];
}
