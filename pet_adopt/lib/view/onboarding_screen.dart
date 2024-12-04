import 'package:pet_adopt/constants/images_assets.dart';
import 'package:pet_adopt/view/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(AppImages.dogsHome,height: 300,),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    const Text(
                      "Welcome To Pet Adoption ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 150),
                      child: const Text(
                        "Easy Pet Adoption",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginIn()));
                },
                style: const ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size.fromWidth(207)),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromRGBO(121, 0, 145, 1)),
                ),
                child: const Text(
                  "Open App",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
