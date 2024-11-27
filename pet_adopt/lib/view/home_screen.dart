import 'dart:convert';
import 'package:pet_adopt/constants/images_assets.dart';
import 'package:pet_adopt/widgets/bottom_navigator_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> pets = [];

  @override
  void getPets() async {
    var client = http.Client();
    var url = ""; // Adicione a URL correta aqui

    try {
      var response = await client.get(Uri.parse(url));

      var responseData = jsonDecode(response.body);
      print("element");

      for (var element in responseData['pets']) {
        setState(() {
          pets.add(element);
        });
      }
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
    print(pets.length);

    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Image.asset(AppImages.dogsHome),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: const Row(
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            
            const CategoriasContainer(),

            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 5, left: 20),
              child: const Row(
                children: [
                  Text(
                    "Popular pets",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
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
                return CardPet(name: pets[index]['name'], images: images);
              },
            ),
          ],
        ),
      ),
    );
  }
}
