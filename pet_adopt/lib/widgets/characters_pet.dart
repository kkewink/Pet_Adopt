import 'package:flutter/material.dart';

class CharacteristicPet extends StatelessWidget {
  final String title;
  final String subTitle;

  const CharacteristicPet({
    super.key,
    required  this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 71, 0, 99)),
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          Text(subTitle, style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}