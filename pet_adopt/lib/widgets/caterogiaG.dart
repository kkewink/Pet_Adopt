import 'package:pet_adopt/view/cat_screen.dart';
import 'package:pet_adopt/view/pet_details.dart';
import 'package:pet_adopt/widgets/characters_pet.dart';
import 'package:flutter/material.dart';

class CategoriaG extends StatelessWidget {

  final String nome;
  
  const CategoriaG({
    super.key,
    required this.nome
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: 80,
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 71, 0, 99),
              // border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(10),
          child:  Text(nome,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center)),
              onTap: () {
                      Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CatsScreen()));
              },
    );
  }
}