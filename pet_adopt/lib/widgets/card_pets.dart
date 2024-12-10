import 'dart:ffi';
import 'package:pet_adopt/constants/images_assets.dart';
import 'package:pet_adopt/view/pet_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

class CardPet extends StatefulWidget {
  final String name;
  final List<dynamic> images;
  final int age;
  final double weight;
  final String color;

  const CardPet({
    super.key,
    required this.name,
    required this.images,
    required this.age,
    required this.weight,
    required this.color,
  });


  @override
  State<CardPet> createState() => cardPetState();
}
  class cardPetState extends State<CardPet>{
  initState(){
    super.initState();
  }

  Widget build(BuildContext context) {

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 125,
            height: 260,
            decoration: BoxDecoration(
                border: Border.all(width: 0.3),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(widget.images[0].toString(), height: 130, width: 250, fit: BoxFit.cover,),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(widget.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Text(
                                "${widget.age} Year",
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                              const Icon(
                                Icons.male,
                                color: Colors.blue,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PetsDetails(
                  name: widget.name,
                  image: widget.images[0].toString(),
                  weight: widget.weight,
                  color: widget.color,
                  age: widget.age,
                )));
      },
    );
  }
}