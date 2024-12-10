import 'dart:convert';
import 'package:pet_adopt/widgets/card_pets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Map<String, dynamic>> pets = [];

  void getPets() async {
    var client = http.Client();
    await initLocalStorage();

    var token = localStorage.getItem("token");

    if (token == null) {
      print("Não apareceu o token");
    }

    var url = ''; // Adicione a URL correta aqui

    try {
      var response = await client.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      var responseData = jsonDecode(response.body);

      print("element");

      for (var element in responseData['pets']) {
        setState(() {
          pets.add(element);
        });
      }
    } catch (e) {
      print("Erro: $e");
    } finally {
      client.close();
    }
  }

  @override
  void initState() {
    super.initState();
    getPets();
  }

  @override
  Widget build(BuildContext context) {
    const cats = [
      {
        "imagem": "",
        "idade": "1",
      },
      {
        "imagem": "",
        "idade": "1",
      },
      {
        "imagem": "",
        "idade": "1",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Favorites",
              style: TextStyle(
                color: Color.fromARGB(255, 71, 0, 99),
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            Icon(
              Icons.pets,
              color: Color.fromARGB(255, 71, 0, 99),
              size: 40,
            ),
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
              itemCount: pets.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                List<dynamic> images = pets[index]['images'];

                return CardPet(
                  name: pets[index]['name'],
                  images: images,
                  age: pets[index]['age'],
                  weight: pets[index]['weight'].toDouble(),
                  color: pets[index]['color'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
