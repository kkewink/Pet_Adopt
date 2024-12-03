import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black, // Cor escura para o appBar
      ),
      backgroundColor: Colors.black, // Cor escura para o fundo da página
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 71, 0, 99),
                  border: Border.all(width: 1, color: Colors.white), // Borda branca para contrastar com o fundo escuro
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white), // Texto branco para contrastar com o fundo escuro
                  decoration: InputDecoration(
                    icon: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Icon(
                        Icons.person,
                        size: 25,
                        color: Color.fromRGBO(255, 255, 255, 1), // Ícone claro
                      ),
                    ),
                    hintText: "Name",
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1), // Dica de texto clara
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 71, 0, 99),
                  border: Border.all(width: 1, color: Colors.white), // Borda branca
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white), // Texto branco
                  decoration: InputDecoration(
                    icon: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Icon(
                        Icons.email,
                        size: 25,
                        color: Color.fromRGBO(255, 255, 255, 1), // Ícone claro
                      ),
                    ),
                    hintText: "Email",
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1), // Dica de texto clara
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 71, 0, 99),
                  border: Border.all(width: 1, color: Colors.white), // Borda branca
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white), // Texto branco
                  decoration: InputDecoration(
                    icon: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Icon(
                        Icons.lock,
                        size: 25,
                        color: Color.fromRGBO(255, 255, 255, 1), // Ícone claro
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1), // Dica de texto clara
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
