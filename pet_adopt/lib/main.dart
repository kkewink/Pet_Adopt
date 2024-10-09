import 'package:flutter/material.dart';
import 'package:pet_adopt/view/home.dart';
import 'package:pet_adopt/view/load.dart';
import 'package:pet_adopt/view/singUp.dart';
import 'package:pet_adopt/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomeP(),
    );
  }
}