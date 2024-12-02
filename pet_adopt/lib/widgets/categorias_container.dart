import 'package:pet_adopt/widgets/categoria.dart';
import 'package:flutter/material.dart';

class CategoriasContainer extends StatelessWidget {
  const CategoriasContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Categoria(nome: "Dogs",),
          Categoria(nome: "Cats",),
        ],
      ),
    );
  }
}