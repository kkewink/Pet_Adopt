import 'dart:convert';

import 'package:pet_adopt/constants/images_assets.dart';
import 'package:pet_adopt/view/home_screen.dart';
import 'package:pet_adopt/view/singUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LoginInState();

}

  class _LoginInState extends State<LogIn> {
    String msgErro = "";
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    
    @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void fazerLogin() async {

      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        return setState(() => {
          msgErro = "Valide seus dados"
        });
      }

     var client = http.Client();
     var url = '';
     var data = {
        "email": emailController.text,
        "password": passwordController.text
     };
     try{
        var response = await client.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data));
        var responseData = jsonDecode(response.body);
        print(responseData['sucess']);

        if (responseData['sucess'] != true) {
          print(responseData['message']);

          setState((){msgErro = responseData['message'];});
        }
     }finally{
      client.close();
     }
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          
          child: Column(
            children: [
              const Center(
                child: 
                Column(
                  children: [
                    Icon(Icons.pets, color: Colors.white,size: 50,),
                    Text("Login",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white
                    ),),
                  ],
                ),
              ), 


              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 63, 35, 87)
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: const Row(
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
                                ),
                            )],
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
                                  hintText: "ghd@email.com",
                                  hintStyle: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  border: InputBorder.none
                                  // border
                                  ),
                            ),
                          ),
                          
                     Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: const Row(
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
                                ),
                            )],
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
                                  border: InputBorder.none
                                  // border
                                  ),
                            ),
                          ),
                    Text(msgErro),
                    Center(
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          // border: Border.all(width: 2),
                          // borderRadius: BorderRadius.circular(233)
                        ),
                        child: ElevatedButton(
                          onPressed: (){},
                          child: const Text("Login", style: TextStyle(color: Colors.white),),
                          style:  ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                       // Sem bordas arredondadas
                    ),
                    backgroundColor: Colors.purple
                                ),
                          ),
                      ),
                    ),
                    
                    const Center(
                      child: Text("Or",style: TextStyle(color: Colors.purple),
                      ),
                    ),
                    
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.insert_emoticon_sharp,color: Colors.white,),
                        Icon(Icons.insert_emoticon_sharp,color: Colors.white,)
                      ],
                    ),
                    const Center(
                      child: Text("Don't have an account?",style: TextStyle(color: Colors.purple),
                      ),
                    ),

                    const Center(
                      child: Text("Create",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                      

                                ],
                              ),
                            ),
                  ],
                ),
              ),
  ]),

    )]))));
  }
}
  