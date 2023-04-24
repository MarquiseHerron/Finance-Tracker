import 'package:finances/barGraph/Info_bargraph_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class MyBarGraph extends StatelessWidget{
  final double? maxY;
  final double sundayAmount;
  final double mondayAmount;
  final double tuesdayAmount;
  final double wednesdayAmount;
  final double thursdayAmount;
  final double fridayAmount;
  final double saturdayAmount;

  const MyBarGraph({
    super.key,
  required this.maxY,
    required this.sundayAmount,
    required this.mondayAmount,
    required this.tuesdayAmount,
    required this.wednesdayAmount,
    required this.thursdayAmount,
    required this.fridayAmount,
    required this.saturdayAmount,
  });

  @override
  Widget build(BuildContext context){
    BarInfo myBarInfo = BarInfo(
      sundayAmount: sundayAmount,
      mondayAmount: mondayAmount,
      tuesdayAmount: tuesdayAmount,
      wednesdayAmount: wednesdayAmount,
      thursdayAmount: thursdayAmount,
      fridayAmount: fridayAmount,
      saturdayAmount: saturdayAmount,
    );
  myBarInfo.initializeBargrpahData();


    return BarChart(
      BarChartData(
      maxY: maxY,
      minY: 0,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            )),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: myBarInfo.barInfo.map(
            (data) => BarChartGroupData(x: data.x,
              barRods: [
                BarChartRodData(toY: data.y,
                color: Colors.blueGrey,
                  width: 25,
                  borderRadius: BorderRadius.circular(3),
                  backDrawRodData: BackgroundBarChartRodData(
                    show:true,
                    toY: maxY,
                    color: Colors.amber,
                  )
                ),
              ],
            ),

        )
            .toList(),
      ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta){
  const style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch(value.toInt()){
    case 0: text = const Text('Sun', style: style);
      break;
    case 1: text = const Text('Mon', style: style);
    break;
    case 2: text = const Text('Tue', style: style);
    break;
    case 3: text = const Text('Wed', style: style);
    break;
    case 4: text = const Text('Thu', style: style);
    break;
    case 5: text = const Text('Fri', style: style);
    break;
    case 6: text = const Text('Sat', style: style);
    break;
    default:
    text = const Text(' ', style: style);
  break;
  }
  return SideTitleWidget(child: text,
      axisSide: meta.axisSide,
  );
}