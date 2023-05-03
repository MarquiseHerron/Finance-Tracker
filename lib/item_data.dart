 import 'package:finances/DetailsItem.dart';
import 'package:finances/GuideTime.dart';
import 'package:flutter/cupertino.dart';

  class ItemData extends ChangeNotifier {

  // This code here will list all of the users expenses
  List<DetailsItem> TotalCostList= [];
  // This one will gather all the expense that are listed
  List<DetailsItem> getCostList(){
  return TotalCostList;
 }
 //User can interact and add a NewCost of a object, payment, etc.
  void addCost(DetailsItem newCost){
    TotalCostList.add(newCost);

    notifyListeners();
  }
//When the task or cost is old user has ability to delete.
  void removeCost(DetailsItem oldCost){
    TotalCostList.remove(oldCost);

    notifyListeners();
  }
// This List out the days of the week Starting with Sunday
  String weekDay(DateTime dateTime){
    switch (dateTime.weekday){
      case 1:
        return 'Sunday';
      case 2:
        return 'Monday';
      case 3:
        return 'Tuesday';
      case 4:
        return 'Wednesday';
      case 5:
        return 'Thursday';
      case 6:
        return 'Friday';
      case 7:
        return 'Sunday';
      default:
        return ' ';
    }
  }
  //Make sure the start date is Sunday
  DateTime firstDayOfWeek(){
    DateTime? FirstDay;
    DateTime today = DateTime.now();
    // This loop will start from sunday going forward!
    for( int i = 0; i<7; i++){
      if(weekDay(today.subtract(Duration(days: i))) == 'Sunday'){
        FirstDay = today.subtract(Duration(days: i));
      }
    }
    return FirstDay!;
  }



  Map<String, double> calculationOfDailyPurchases(){
    Map<String, double> summaryPurchases = {

    };
    for (var expense in TotalCostList){
      String date = changeTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if(summaryPurchases.containsKey(date)){
        double currentAmount = summaryPurchases[date]!;
        currentAmount += amount;
        summaryPurchases[date] = currentAmount;
      }
      else{
        summaryPurchases.addAll({date: amount});
      }
    }
    return summaryPurchases;
  }
 }