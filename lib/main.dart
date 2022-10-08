import 'package:flutter/material.dart';
import 'package:listview/screens/home_page.dart';

//ignore_for_file:prefer_const_constructors

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}