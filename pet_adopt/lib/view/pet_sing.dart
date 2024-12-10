import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pet_adopt/view/home_screen.dart';
import 'package:pet_adopt/view/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class AddPet extends StatefulWidget {
  const AddPet({super.key});

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController colorController = TextEditingController();
    TextEditingController imageController = TextEditingController();

    String msgError = "";

    void addPet() async {
      await initLocalStorage();
      var token = localStorage.getItem("token");

      print(token.toString());
      if (token == null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const LoginIn()));
      }

      var client = http.Client();
      var url = "https://pet-adopt-dq32j.ondigitalocean.app/pet/create";
      var data = {
        "name": nameController.text,
        "color": colorController.text,
        "weight": weightController.text,
        "age": ageController.text,
        "images": [imageController.text]
      };

      try {
        print(json.encode(data));
        var response = await client.post(Uri.parse(url),
         body: json.encode(data),
          headers: {
            'Content-Type' : 'application/json', 'Authorization' : 'Bearer ${token}'});  
        print(response.body);

        setState(() {
          msgError = response.body;
        });
      } catch (e) {
        print(e);
      } finally {
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
                "Add pet",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              _buildTextField(
                controller: nameController,
                label: "",
                hintText: "Name",
                icon: Icons.text_fields,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: ageController,
                label: "",
                hintText: "Age",
                icon: Icons.calendar_month,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: weightController,
                label: "",
                hintText: "Weight",
                icon: Icons.pets,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: colorController,
                label: "",
                hintText: "Color",
                icon: Icons.pets,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: imageController,
                label: "",
                hintText: "Image",
                icon: Icons.pets,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Text(msgError, style: const TextStyle(color: Colors.red)),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: ()  {
                    addPet();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 1, color: Color.fromRGBO(233, 82, 238, 1)),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Add pet",
                    style: TextStyle(
                      color: Color.fromRGBO(233, 82, 238, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
