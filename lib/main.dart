import 'package:finances/Boarding%20screen/boarding_screen.dart';
import 'package:finances/item_data.dart';
import 'package:finances/first_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemData(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BoardingScreen(),
      ),
    );


  }
}


