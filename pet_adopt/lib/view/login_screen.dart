import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pet_adopt/constants/images_assets.dart';
import 'package:pet_adopt/view/singUp_screen.dart';
import 'package:pet_adopt/main.dart';

class LoginIn extends StatefulWidget {
  const LoginIn({super.key});

  @override
  State<LoginIn> createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  String msgErro = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    setState(() {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        msgErro = "Preencha todos os campos!";
      } else {
        msgErro = "";
        print(
            "Email: ${emailController.text}, Password: ${passwordController.text}");
      }
    });
  }

  void fazerLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        msgErro = "Valide seus dados";
      });
      return;
    }

    var client = http.Client();
    var url = 'https://example.com/login'; // Substitua pela URL correta.
    var data = {
      "email": emailController.text,
      "password": passwordController.text
    };

    try {
      var response = await client.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      var responseData = jsonDecode(response.body);
      print(responseData['success']);

      if (responseData['success'] != true) {
        print(responseData['message']);
        setState(() {
          msgErro = responseData['message'];
        });
      }
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Column(
                  children: [
                    Icon(Icons.pets, color: Colors.white, size: 50),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 38, 13, 59),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 71, 0, 99),
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                icon: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Icons.email_outlined,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                hintText: "ghd@email.com",
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        const Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 71, 0, 99),
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Icon(
                                  Icons.lock_outline,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: "******",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity, // Largura total do pai (Container)
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.zero, // Sem bordas arredondadas
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15), // Ajuste da altura
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Or",
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.asset(AppImages.googleIcon, width: 40),
                        const SizedBox(width: 20),
                        // Image.asset(AppImages.facebookIcon, width: 40),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    GestureDetector(
                      onTap: () {

                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SingUp(),
                      ));
                      },
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(color: Color.fromRGBO(233, 82, 238, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
