import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class Calendar extends StatefulWidget{
  const Calendar({Key? key}) : super(key:key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.week,
        firstDayOfWeek: 6,

      ),

    );
  }
}

