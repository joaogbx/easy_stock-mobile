import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardActionWidget extends StatelessWidget {
  const CardActionWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      // Cor de fundo alterada para tom escuro
      color: const Color.fromARGB(
        255,
        140,
        37,
        199,
      ), // Cinza escuro para o Card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Cor do ícone principal alterada para branco
              Icon(icon, size: 30, color: Colors.white),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        // Cor do título alterada para branco
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        // Cor do subtítulo alterada para branco suave
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              // Cor do ícone de seta alterada para branco suave
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
            ],
          ),
        ),
      ),
    );
  }
}
