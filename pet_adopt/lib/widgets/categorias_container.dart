import 'package:pet_adopt/widgets/categoria.dart';
import 'package:flutter/material.dart';

class CategoriasContainer extends StatelessWidget {
  const CategoriasContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(  // Centraliza o conteúdo na tela
      child: SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,  // Garante que o ListView não ocupe mais espaço do que o necessário
          children: const [
            Categoria(nome: "Dogs"),
            Categoria(nome: "Cats"),
          ],
        ),
      ),
    );
  }
}
