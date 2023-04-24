import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.lightBlueAccent,
      child: const Center(
        child: Text('Finance lister starts Now!'
            '\n Click dollar sign in bottom right corner to add to list'),
      ),
    );
  }
}