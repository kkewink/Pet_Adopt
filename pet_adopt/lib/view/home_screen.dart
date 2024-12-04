import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';


import 'package:pet_adopt/view/edit_profile.dart';
import 'package:pet_adopt/view/favorite_screen.dart';
import 'package:pet_adopt/view/pet_sing.dart';
import 'package:pet_adopt/view/login_screen.dart';
import 'package:pet_adopt/view/pets_screen.dart';
import 'package:pet_adopt/widgets/categoria.dart';
import 'package:pet_adopt/widgets/categorias_container.dart';
import 'package:pet_adopt/widgets/card_pets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> pets = [];
  String nameUser = "";
  

@override
void getPets() async {
  var client = http.Client();

  var url = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';


  try{
    var response = await client.get(Uri.parse(url),
    );

    var responseData = jsonDecode(response.body);


    print("elment");

    for (var element in responseData['pets']) {
      setState(() {
        pets.add(element);
      });
    }
  }finally{
    client.close();
  }
}

  void getUser() async{
    await initLocalStorage();

    var client = http.Client();

    var idUser = localStorage.getItem("_idUser");
    var token = localStorage.getItem("token");

    if(idUser == null || token == null){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginIn()));
    }

    var url = "https://pet-adopt-dq32j.ondigitalocean.app/user/${idUser.toString()}";
    var response = await client.get(Uri.parse(url));
    var responseData = jsonDecode(response.body);

    setState(() {
      nameUser = responseData['user']['name'];
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Adicionando chave global

  @override
  void initState() {
    getUser();
    getPets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(pets.length);
    return Scaffold(
      key: _scaffoldKey, // Atribuindo a chave ao Scaffold
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Abre o Drawer
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 53, 53, 53)),
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
              title: const Text('account pets'),
              onTap: () {
                Navigator.of(context).pop(); // Fecha o drawer
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const MyPets()),
                ); // Navega para a página de informações da conta
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets, color: Colors.black),
              title: const Text('Add pets'),
              onTap: () {
                Navigator.of(context).pop(); // Fecha o drawer
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const AddPet()),
                ); // Nav
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.black),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.of(context).pop(); // Fecha o drawer
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const FavoriteScreen()),
                ); // Navega para a página de favoritos
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).pop(); // Fecha o drawer
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EditProfile()),
                ); // Navega para a página de configurações
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
                            MaterialPageRoute(
                                builder: (context) => const LoginIn()),
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
              const CategoriasContainer(), // Exibe as categorias

              // GridView com os pets
              Expanded(
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
