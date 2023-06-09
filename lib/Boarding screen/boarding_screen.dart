import 'package:finances/Boarding%20screen/screen_one.dart';
import 'package:finances/Boarding%20screen/screen_three.dart';
import 'package:finances/Boarding%20screen/screen_two.dart';
import 'package:finances/first_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatefulWidget{
  const BoardingScreen({Key? key}) : super(key:key);

  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}
class _BoardingScreenState extends State<BoardingScreen>{
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
       children: [
         PageView(
           controller: _controller,
           onPageChanged: (index){
             setState(() {
               onLastPage = (index == 2);
             });
           },
           children: [
            ScreenOne(),
             ScreenTwo(),
             ScreenThree(),
           ],
         ),
         Container(
           alignment: Alignment(0,0.75),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               GestureDetector(
                  onTap: () {
           _controller.jumpToPage(2);
         },
                   child: Text('Skip'),
               ),
               SmoothPageIndicator(controller: _controller, count: 3),
            onLastPage ?
             GestureDetector(
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder:(context){
                   return MyHomePage();
                 },
                 ),
                 );
               },
                 child: Text('done'),
             ): GestureDetector(
              onTap: () {
                _controller.nextPage(duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              child: Text('next'),
            ),
             ],
           ),
         ),
       ],
      ),
    );
  }
}