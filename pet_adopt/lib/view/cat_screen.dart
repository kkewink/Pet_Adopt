import 'package:pet_adopt/widgets/card_pets.dart';
import 'package:pet_adopt/widgets/categorias_container.dart';
import 'package:flutter/material.dart';

class CatsScreen extends StatelessWidget {
  
  const CatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const cats = [
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Cats",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cats.length,
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