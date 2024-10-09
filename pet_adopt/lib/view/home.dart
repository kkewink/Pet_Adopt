import 'package:flutter/material.dart';

class HomeP extends StatelessWidget {
  const HomeP({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        Image: DecorationImage(
            image: AssetImage('assets/images/background.png'), // Caminho da imagem de background
            fit: BoxFit.cover,
          ),
        body: SingleChildScrollView(
          child: Column(

          ),
        ),
      ),

    );
  }
}