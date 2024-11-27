import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.pets,color: Colors.white,size: 50,),
                Text("Pets Disponiveis",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white
                    ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}