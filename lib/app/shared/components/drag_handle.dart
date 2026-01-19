import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 15, bottom: 30),
        child: Container(
          // Dimensões e Estilo da Barrinha
          width: 40,
          height: 4,

          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 188, 188, 188),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
