import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/api_constants.dart';

class LinearGraph extends StatelessWidget {
  const LinearGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 450,
        height: 250,
        child: LineChart(LineChartData(
          titlesData: FlTitlesData(
              rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: false)), // sağ tarafta dereceleri kaldırdım.
              topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                      showTitles:
                          false)), // üstte bulunan dereceleri kaldırdım.
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: true,
                // getTitlesWidget: (value, meta) {
                //   // Burada X axis yazıları
                //   switch (value.toInt()) {
                //     case 0:
                //       return Text('Pzt');
                //     case 1:
                //       return Text('Sal');
                //     case 2:
                //       return Text('Çar');
                //     case 3:
                //       return Text('Per');
                //     case 4:
                //       return Text('Cum');
                //   }
                //   return Text('');
                // },
              ))),
          borderData: FlBorderData(show: true), // grafiğin kenar çizgileri
          gridData:
              const FlGridData(show: true), // grafiğin içinde ki çizgiler.
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 10),
                FlSpot(1, 40),
                FlSpot(2, 30),
                FlSpot(3, 50),
                FlSpot(4, 20),
                FlSpot(5, 70)
              ],
              isCurved: false,
              color: AppColors.primaryColor,
              barWidth: 2,
              dotData: FlDotData(show: true),
            ),
          ],
        ))

        //  ListTile(
        //   title: Text(
        //     "Stoğu Azalan Ürünler Raporu",
        //     style: Theme.of(context).textTheme.bodyMedium,
        //   ),
        //   trailing: const Icon(Icons.download),
        //   onTap: () {},
        // ),
        );
  }
}
