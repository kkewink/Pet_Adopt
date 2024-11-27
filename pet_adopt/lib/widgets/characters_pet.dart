import 'package:flutter/material.dart';

class CharacteristicPet extends StatelessWidget {
  const CharacteristicPet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(20)
      ),
      child: const Column(
        children: [
          Text("Shih Tzu", style: TextStyle(color: Colors.white)),
          Text("Breed", style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}