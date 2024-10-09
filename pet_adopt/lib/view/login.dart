import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
                              decoration: InputDecoration(
                                  icon: Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: const Icon(
                                        Icons.password,
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
                      child: Text("REGISTER",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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