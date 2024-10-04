import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: 
                Text("Sing Up",
                style: TextStyle(
                    fontSize: 30,
                  
                ),),
              ), 
              Center(
                child: 
                TextField(
                  style: TextStyle(fontSize:18 ),
                ),
              ),
              Center(
                child: 
                TextField(
                  style: TextStyle(fontSize:18 ),
                  
                ),
              ),
              Center(
                
              )
            ],
          ),
        ),
      ),

    );
  }
}