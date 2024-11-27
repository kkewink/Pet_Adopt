import 'dart:convert';
import 'dart:io';

import 'package:pet_adopt/constants/images_assets.dart';
import 'package:pet_adopt/view/home_screen.dart';
import 'package:pet_adopt/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();

    void cadastro() async {
      var data = {
        "name": nameController.text,
        "phone": phoneController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirmpassword": confirmPassController.text
      };

      var client = http.Client();
      var url = "";

      try {
        var response = await client.post(Uri.parse(url),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(data));

        var responseData = jsonDecode(response.body);
        print(responseData);
      } finally {
        client.close();
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.pets,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(12),
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 63, 35, 87)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: const Row(
                              children: [
                                Text(
                                  "Nome",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  icon: Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: const Icon(
                                        Icons.email_outlined,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                  hintText: "Digite seu nome",
                                  hintStyle: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: const Row(
                              children: [
                                Text(
                                  "Telefone",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                  icon: Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: const Icon(
                                        Icons.phone_outlined,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                  hintText: "Digite seu telefone",
                                  hintStyle: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: const Row(
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  icon: Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: const Icon(
                                        Icons.email_outlined,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                  hintText: "abc@email.com",
                                  hintStyle: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: const Row(
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  icon: Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: const Icon(
                                        Icons.lock_outline,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                  hintText: "******",
                                  hintStyle: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: const Row(
                              children: [
                                Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: confirmPassController,
                              decoration: InputDecoration(
                                  icon: Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: const Icon(
                                        Icons.lock_outline,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                  hintText: "******",
                                  hintStyle: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top:50),
                      child: ElevatedButton(
                        onPressed:(){
                          cadastro();
                        },
                        style: const ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(Size.fromWidth(207)),
                          padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                         child: const Text(
                          "Criar Conta",
                          style: TextStyle(color: Colors.black,fontSize: 20),
                         )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:20),
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Image.asset(AppImages.googleIcon),
                            Image.asset(AppImages.facebookIcon),
                            Image.asset(AppImages.twitterIcon)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ja tem Conta?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            child: Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 62, 152, 100),
                              fontSize: 14
                            )),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginIn()));
                            },
                          )
                        ],
                      ),
                    )
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
