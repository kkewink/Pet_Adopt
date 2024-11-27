import 'package:pet_adopt/constants/images_assets.dart';
import 'package:pet_adopt/widgets/bottom_navigator_widget.dart';
import 'package:pet_adopt/widgets/characters_pet.dart';
import 'package:flutter/material.dart';

class PetDetails extends StatelessWidget {
  const PetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              elevation: WidgetStatePropertyAll(0)
              ),
            onPressed: () {  },
            child: Icon(Icons.favorite_border,size: 35,),
          )
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            
            Image.asset(AppImages.dog1, width: MediaQuery.of(context).size.width, fit: BoxFit.contain,),
             Container(
              margin: const EdgeInsets.only(left: 20),
               child: Row(
                children: [
                  const Text("Austin", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Icon(Icons.male, color: Colors.blue,size: 32,))
                ],
                           ),
             ),


            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Row(
                children: [
                  Icon(Icons.location_on_outlined, color: Color.fromRGBO(154, 154, 154, 100),size: 25,),
                  Text("5 km away", style: TextStyle(color: Color.fromRGBO(154, 154, 154, 100), fontSize: 18),)
                ],
              ),
            ),


            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CharacteristicPet(),
                  CharacteristicPet(),
                  CharacteristicPet(),
                  CharacteristicPet(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child:  Row(
                children: [
                  const Icon(Icons.pets, size: 40,),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text("Health", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding:const EdgeInsets.all(10) ,
              decoration:  BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(20)
              ),
              child: 
              const SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Fully vaccinated", style: TextStyle(color: Colors.white),),
                    ),
                    Padding(  
                      padding: EdgeInsets.all(8.0),
                      child: Text("Good immunutiy", style: TextStyle(color: Colors.white),),
                    )
                ],),
              ),
            )
          ],
          
        ),
        
      ),
      // bottomNavigationBar: BottomNavigatorWidget(), 
      
    );
  }
}
