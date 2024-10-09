import 'package:flutter/material.dart';

class Load extends StatelessWidget {
  const Load({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: 
                Column(
                  children: [
                    Icon(Icons.pets,color: Colors.white,size: 50,),
                    Text("Pet Adopt", style: TextStyle(fontSize: 28,color: Colors.white),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}