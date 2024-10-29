import 'package:flutter/material.dart';

class HomeP extends StatelessWidget {
  const HomeP({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: const Scaffold(
        Imagem: const DecorationImage(
            image:const AssetImage('assets/images/background.png'), // Caminho da imagem de background
            fit: BoxFit.cover,
          ),
        body: const SingleChildScrollView(
          child: const  Column(

          ),
        ),
      ),

    );
  }
}