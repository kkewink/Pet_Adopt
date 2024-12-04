import 'package:pet_adopt/widgets/card_pets.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
    ];

    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Favorites", style: TextStyle(color:  Color.fromARGB(255, 71, 0, 99), fontWeight: FontWeight.bold, fontSize: 40),),
            Icon(Icons.pets, color: Color.fromARGB(255, 71, 0, 99),size: 40 ,)
          ],
        ),
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
                itemBuilder: (context, index) {},
              ),
          ],
        ),
      ),
    );
  }
}