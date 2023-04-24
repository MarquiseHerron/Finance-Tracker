import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.amber,
      child: const Center(
        child: Image(
          image: NetworkImage(
              'https://th.bing.com/th/id/R.3bf8e1ebb4e6be23f47278f1fcfcd6e1?rik=mtFueEwWJ9Er7w&riu=http%3a%2f%2fclipground.com%2fimages%2faccountancy-clipart-15.jpg&ehk=e8gxJvLat%2bFxu02gvtk4YzD3tFyIa5H3WZTd4IWblVM%3d&risl=&pid=ImgRaw&r=0'),
        ),
      ),
    );
  }
}