import 'package:flutter/material.dart';
import 'package:avengers/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avengers',
      home: MySplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
