import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:pet_adopt/constants/images_assets.dart';
import 'package:pet_adopt/widgets/categorias_container.dart';
import 'package:pet_adopt/widgets/card_pets.dart';
import 'package:pet_adopt/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> pets = [];
  String nameUser = "";

  @override
  void initState() {
    super.initState();
    getUser();
    getPets();
  }

  // Função para obter pets
  void getPets() async {
    var client = http.Client();
    var url = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';

    try {
      var response = await client.get(Uri.parse(url));
      var responseData = jsonDecode(response.body);

      for (var element in responseData['pets']) {
        setState(() {
          pets.add(element);
        });
      }
    } finally {
      client.close();
    }
  }

  // Função para obter dados do usuário
  void getUser() async {
    await initLocalStorage();

    var client = http.Client();
    var idUser = localStorage.getItem("_idUser");
    var token = localStorage.getItem("token");

    if (idUser == null || token == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginIn()));
      return; // Evita continuar se não houver idUser ou token
    }

    var url =
        "https://pet-adopt-dq32j.ondigitalocean.app/user/${idUser.toString()}";
    var response = await client.get(Uri.parse(url));
    var responseData = jsonDecode(response.body);
    
    setState(() {
      nameUser = responseData['user']['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Se o Drawer for necessário, esse código pode ser habilitado
            // _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 53, 53, 53)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop(); // Fecha o menu lateral
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text('Account information'),
              onTap: () {
                // Ação do menu "Account information"
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets, color: Colors.black),
              title: const Text('My pets'),
              onTap: () {
                // Ação do menu "My pets"
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.black),
              title: const Text('Favorites'),
              onTap: () {
                // Ação do menu "Favorites"
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text('Settings'),
              onTap: () {
                // Ação do menu "Settings"
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Tem certeza que deseja sair?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const LoginIn()),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          'Sair',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Icon(
                Icons.pets,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text(
                'Categoria',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800],
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // Título de "Categories"
              const Row(
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const CategoriasContainer(), // Exibe as categorias

              // Título de "Popular pets"
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

              // GridView com os pets
              Expanded( // Adicionado Expanded para o GridView ocupar o espaço restante
                child: GridView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
