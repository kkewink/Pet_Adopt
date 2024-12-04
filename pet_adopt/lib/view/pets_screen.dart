import 'package:pet_adopt/widgets/card_pets.dart';
import 'package:pet_adopt/widgets/categorias_container.dart';
import 'package:flutter/material.dart';

class MyPets extends StatelessWidget {
  
  const MyPets({super.key});

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
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Dogs",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
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