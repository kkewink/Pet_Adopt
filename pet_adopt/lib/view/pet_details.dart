import 'package:pet_adopt/constants/images_assets.dart';
import 'package:pet_adopt/widgets/characters_pet.dart';
import 'package:flutter/material.dart';

class PetsDetails extends StatelessWidget {
  const PetsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Definindo o fundo preto
      appBar: AppBar(
        backgroundColor: Colors.black, // AppBar também ficará preta
        elevation: 0, // Removendo a sombra
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
              elevation: WidgetStateProperty.all(0),
            ),
            onPressed: () {},
            child: const Icon(
              Icons.favorite_border,
              size: 35,
              color: Color.fromARGB(255, 102, 0, 150), // Ícone de coração branco para visibilidade
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagem do pet
            Image.asset(
              AppImages.dog1,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
            
            // Nome e ícone do pet
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  const Text(
                    "Duke",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Texto branco para contraste
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Icon(
                      Icons.male,
                      color: Colors.blue,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),

            // Localização
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10),
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Color.fromRGBO(154, 154, 154, 1),
                    size: 25,
                  ),
                  Text(
                    "1 km away",
                    style: TextStyle(
                      color: Color.fromRGBO(154, 154, 154, 1),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            // Características do pet
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CharacteristicPet(),
                ],
              ),
            ),
            
            // Título de "Health"
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.pets,
                    size: 40,
                    color: Colors.white, // Ícone branco
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "Health",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white, // Título branco
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Informações sobre a saúde do pet
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Fully vaccinated",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Good immunity",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
