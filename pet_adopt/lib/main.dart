import 'package:flutter/material.dart';
import 'package:pet_adopt/view/home_screen.dart';
import 'package:pet_adopt/view/load_screen';
import 'package:pet_adopt/view/singUp_screen.dart';
import 'package:pet_adopt/view/login_screen.dart';
import 'package:pet_adopt/view/pet_sing.dart';
import 'package:pet_adopt/view/dog_screen.dart';
import 'package:pet_adopt/view/favorite_screen.dart';
import 'package:pet_adopt/view/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const OnboardingScreen(),
    );
  }
}