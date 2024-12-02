import 'package:pet_adopt/widgets/card_pets.dart';
import 'package:pet_adopt/widgets/categorias_container.dart';
import 'package:flutter/material.dart';

class DogsScreen extends StatelessWidget {
  
  const DogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const dogs = [
      {
        "imagem" : "",
        "idade" : "1",
      },
      {
        "imagem" : "",
        "idade" : "1",
      },
      {
        "imagem" : "",
        "idade" : "1",
      },
      {
        "imagem" : "",
        "idade" : "1",
      },
      {
        "imagem" : "",
        "idade" : "1",
      },
      {
        "imagem" : "",
        "idade" : "1",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dogs"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dogs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                },
              ),
          ],
        ),
      ),
    );
  }
}