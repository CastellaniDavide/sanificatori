import 'package:flutter/material.dart';
import 'package:sanificatori/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        backgroundColor: Colors.yellow,
        //brightness: Brightness.dark,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black54,
      ),
      home: Home(),
    );
  }
}
