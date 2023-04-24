import 'package:finances/barGraph/separate_bar.dart';

class BarInfo{
  final double sundayAmount;
  final double mondayAmount;
  final double tuesdayAmount;
  final double wednesdayAmount;
  final double thursdayAmount;
  final double fridayAmount;
  final double saturdayAmount;


  BarInfo({
   required this.sundayAmount,
    required this.mondayAmount,
    required this.tuesdayAmount,
    required this.wednesdayAmount,
    required this.thursdayAmount,
    required this.fridayAmount,
    required this.saturdayAmount,
});

  List<SeparateBar> barInfo = [];

  void initializeBargrpahData(){
    barInfo = [
      SeparateBar(x: 0, y: sundayAmount),

      SeparateBar(x: 1, y: mondayAmount),

      SeparateBar(x: 2, y: tuesdayAmount),

      SeparateBar(x: 3, y: wednesdayAmount),

      SeparateBar(x: 4, y: thursdayAmount),

      SeparateBar(x: 5, y: fridayAmount),

      SeparateBar(x: 6, y: saturdayAmount),
    ];

  }
}