import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'screnns/Quranscreen.dart'; // Ensure this path is correct and the file exists
// Replace with the actual path
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Quranscreen(),);
  }
}




  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.


