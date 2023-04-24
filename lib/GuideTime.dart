  String changeTimeToString(DateTime dateTime){

  String year =dateTime.year.toString();

  String month = dateTime.month.toString();
  // Set default starting month
  if(month.length ==1){
    month = '0' + month;
  }

String day = dateTime.day.toString();
  // Set default starting day
if(day.length ==1){
  day = '0' + day;
}
String yearMonthDay = year + month + day;

return yearMonthDay;
}