import 'package:pet_adopt/widgets/bottom_navigator_widget.dart';
import 'package:flutter/material.dart';

class AddPet extends StatelessWidget {
  const AddPet({super.key});


// Desculpe, essa pagina fiz com preguiça
// As outras fiz com esforço e determinação

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add pet", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 40),),
            Icon(Icons.pets, color: Colors.pink,size: 40 ,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        
        child: Column(
          
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: TextField(
                          decoration: InputDecoration(
                              icon: Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: const Icon(
                                    Icons.text_fields,
                                    size: 25,
                                    color: Color.fromRGBO(42, 42, 42, 0.612),
                                  )),
                              hintText: "Name",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(42, 42, 42, 0.612)),
                              border: InputBorder.none
                              // border
                              ),
                        ),
                        
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: TextField(
                          decoration: InputDecoration(
                              icon: Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: const Icon(
                                    Icons.calendar_month,
                                    size: 25,
                                    color: Color.fromRGBO(42, 42, 42, 0.612),
                                  )),
                              hintText: "Age",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(42, 42, 42, 0.612)),
                              border: InputBorder.none
                              // border
                              ),
                        ),
                        
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: TextField(
                          decoration: InputDecoration(
                              icon: Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: const Icon(
                                    Icons.location_on,
                                    size: 25,
                                    color: Color.fromRGBO(42, 42, 42, 0.612),
                                  )),
                              hintText: "Location",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(42, 42, 42, 0.612)),
                              border: InputBorder.none
                              // border
                              ),
                        ),
                        
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: TextField(
                          decoration: InputDecoration(
                              icon: Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: const Icon(
                                    Icons.pets,
                                    size: 25,
                                    color: Color.fromRGBO(42, 42, 42, 0.612),
                                  )),
                                  
                              hintText: "Sex",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(42, 42, 42, 0.612)),
                              border: InputBorder.none
                              // border
                              ),
                        ),
                        
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: TextField(
                          decoration: InputDecoration(
                              icon: Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: const Icon(
                                    Icons.pets,
                                    size: 25,
                                    color: Color.fromRGBO(42, 42, 42, 0.612),
                                  )),
                                  
                              hintText: "Breed",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(42, 42, 42, 0.612)),
                              border: InputBorder.none
                              // border
                              ),
                        ),
                        
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: TextField(
                          decoration: InputDecoration(
                              icon: Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: const Icon(
                                    Icons.pets,
                                    size: 25,
                                    color: Color.fromRGBO(42, 42, 42, 0.612),
                                  )),
                                  
                              hintText: "Color",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(42, 42, 42, 0.612)),
                              border: InputBorder.none
                              // border
                              ),
                        ),
                        
              ),
            ),
            

            
            Container(
                        width: 200,
                        decoration: BoxDecoration(
                          // border: Border.all(width: 2),
                          // borderRadius: BorderRadius.circular(233)
                        ),
                        child: ElevatedButton(
                          onPressed: (){},
                          child: const Text("Add pet", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),),
                          style:  ElevatedButton.styleFrom(
                            elevation: 0,
                    shape: RoundedRectangleBorder(
                      // side: 1,
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 1, color: Colors.pink),
                      
                       // Sem bordas arredondadas
                    ),
                    backgroundColor: Colors.white
                                ),
                          ),
                      ),
          ],
          
        ),
        
      ),
      // bottomNavigationBar: BottomNavigatorWidget(), 
    );
  }
}