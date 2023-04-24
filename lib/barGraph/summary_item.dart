import 'package:finances/GuideTime.dart';
import 'package:finances/barGraph/bar_graph.dart';
import 'package:finances/item_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ItemSummary extends StatelessWidget{
  final DateTime firstDayOfWeek;
  const ItemSummary({super.key,
  required this.firstDayOfWeek,
  });

  @override
  Widget build(BuildContext context){
    String sunday = changeTimeToString(firstDayOfWeek.add(const Duration(days: 0)));
    String monday = changeTimeToString(firstDayOfWeek.add(const Duration(days: 1)));
    String tuesday = changeTimeToString(firstDayOfWeek.add(const Duration(days: 2)));
    String wednesday = changeTimeToString(firstDayOfWeek.add(const Duration(days: 3)));
    String thursday = changeTimeToString(firstDayOfWeek.add(const Duration(days: 4)));
    String friday = changeTimeToString(firstDayOfWeek.add(const Duration(days: 5)));
    String saturday = changeTimeToString(firstDayOfWeek.add(const Duration(days: 6)));
    return Consumer<ItemData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
          maxY: 100,
          sundayAmount: value.calculationOfDailyPurchases()[sunday]??0,
          mondayAmount: value.calculationOfDailyPurchases()[monday]??0,
          tuesdayAmount: value.calculationOfDailyPurchases()[tuesday]??0,
          wednesdayAmount: value.calculationOfDailyPurchases()[wednesday]??0,
          thursdayAmount: value.calculationOfDailyPurchases()[thursday]??0,
          fridayAmount: value.calculationOfDailyPurchases()[friday]??0,
          saturdayAmount: value.calculationOfDailyPurchases()[saturday]??0,
        ),
      ),
    );
  }
}