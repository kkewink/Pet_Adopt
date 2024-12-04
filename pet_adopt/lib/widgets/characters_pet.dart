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
        color: const Color.fromARGB(255, 71, 0, 99),
        borderRadius: BorderRadius.circular(20)
      ),
      child: const Column(
        children: [
          Text("Labrador", style: TextStyle(color: Colors.white)),
          Text("Cor Chocolate", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}