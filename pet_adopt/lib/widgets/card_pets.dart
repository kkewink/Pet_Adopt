



import 'package:flutter/material.dart';

class CardPet extends StatelessWidget{
  final String name;
  final List<dynamic> images;

  const CardPet({
    super.key,
    required this.name,
    required this.images
  });



  @override
  Widget build(BuildContext context) {
    
    print(images[0].toString());
    return GestureDetector(
      child: Padding(padding: const EdgeInsets.all(8.0)
      child: Container(
        width: 125,
        height: 260
        decoration: BoxDecoration(
          border: Border.all(width: 0.3),
          borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(image[0].toString(), height: 156,width: 260,fit: BoxFit.cover,),
              Row(children: [
                Container(
                  margin: EdgeInsets.only(left:20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(name,
                      style: const TextStyle(
                        fontSize: 16,fontWeight: FontWeight.bold
                      )),
                      const Row(
                        children: [
                          Text(
                            "3 Year",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                            Icon(Icons.male,color: Colors.blue,
                            )
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],)
            ],
          ),
        ),,
      ),
      ),
    )
  }
}