import 'dart:convert';
import 'dart:io';
import 'package:localstorage/localstorage.dart';
import 'package:pet_adopt/constants/images_assets.dart';
import 'package:pet_adopt/view/home_screen.dart';
import 'package:pet_adopt/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {


  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();

    void cadastro() async {
      await initLocalStorage();
      print(localStorage.getItem("token"));


      var data = {
        "name": nameController.text,
        "phone": phoneController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirmpassword": confirmPassController.text
      };

      var client = http.Client();

      var url = "http://pet-adopt-dq32j.ondigitalocean.app/user/register";

      try{
        var response = await client.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data));

        var responseData = jsonDecode(response.body);

        if (responseData['token'] != null) {
          localStorage.setItem("token", responseData['token']);
          localStorage.setItem("_idUser",responseData['userId']);

          Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
        }

        setState(() {
          msgErro: responseData['message'];
        });


        print(responseData);
      } finally{
        client.close();
      }   
    }

 
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Icon(
                Icons.pets,
                color: Colors.white,
                size: 50,
              ),
              const SizedBox(height: 20),
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              _buildTextField(
                controller: nameController,
                label: "Nome",
                hintText: "Digite seu nome",
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: phoneController,
                label: "Telefone",
                hintText: "Digite seu telefone",
                icon: Icons.phone_outlined,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: emailController,
                label: "Email",
                hintText: "abc@email.com",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: passwordController,
                label: "Password",
                hintText: "******",
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: confirmPassController,
                label: "Confirm Password",
                hintText: "******",
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: cadastro,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Já tem conta?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(233, 82, 238, 1),
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      // Substitua pelo componente de login correto
                      print("teste");
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginIn(),
                      ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
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
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,           
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: Container(
                margin: const EdgeInsets.only(left: 15),
                child: Icon(icon, size: 25, color: Colors.white),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
