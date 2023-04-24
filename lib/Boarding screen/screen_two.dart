import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.lime,
      child: const Center(
        child: Image(
          image: NetworkImage('https://th.bing.com/th/id/OIP.uj3rHHHOPTHV7JQpf9F5nQHaF0?pid=ImgDet&rs=1'),
        ),
      ),
    );
  }
}