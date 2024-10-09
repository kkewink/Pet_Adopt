import 'package:flutter/material.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: 
                Column(
                  children: [
                    Icon(Icons.pets,color: Colors.white,size: 50,),
                  Text("Sing Up",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white
                    ),),
                  ],
                ),
              ),
             
             Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color:  Color.fromARGB(255, 63, 35, 87)
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: const Row(children: [
                            Text(
                              "Email",style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold, color:Colors.white,
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
                              decoration: InputDecoration(
                                  icon: Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: const Icon(
                                        Icons.email_outlined,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                  hintText: "",
                                  hintStyle: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  border: InputBorder.none
                                  // border
                                  ),
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
                              decoration: InputDecoration(
                                  icon: Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: const Icon(
                                        Icons.password,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                  hintText: "",
                                  hintStyle: const TextStyle(
                                      
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  border: InputBorder.none
                                  // border
                                  ),
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
                                  "Confirm Passowrd",
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
                              decoration: InputDecoration(
                                  icon: Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: const Icon(
                                        Icons.password,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                  hintText: "",
                                  hintStyle: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  border: InputBorder.none
                                  // border
                                  ),
                            ),
                          ),

                          Center(
                      child: Container(
                        width: 200,
                        
                        decoration: const BoxDecoration(
                        ),
                        child: ElevatedButton(
                          onPressed: (){},
                          // ignore: sort_child_properties_last
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
                      ],
                    ),
                  )
                ],
              ),
             ) 
                ],
          ),
        ),
  ]),
    )]))));
  }
}