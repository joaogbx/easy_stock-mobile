import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart'; // Ajuste o import

class HomeEmployeeSkeleton extends StatelessWidget {
  const HomeEmployeeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsPallete.darkSecondary,
      highlightColor: ColorsPallete.primaryPurple.withOpacity(0.1),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),

            // 🏛️ Skeleton Nome da Empresa
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 👤 Skeleton Header do Usuário
            Row(
              children: [
                const CircleAvatar(radius: 35, backgroundColor: Colors.black),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 22,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 80,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ⚡ Ações Rápidas (Título)
            _buildSectionTitle(),
            const SizedBox(height: 12),
            _buildSkeletonButton(), // Botão Entrada
            const SizedBox(height: 12),
            _buildSkeletonButton(), // Botão Saída

            const SizedBox(height: 30),

            // 🔍 Consultas (Título)
            _buildSectionTitle(),
            const SizedBox(height: 12),
            _buildSkeletonCard(), // Estoque Atual
            const SizedBox(height: 10),
            _buildSkeletonCard(height: 150), // Preview Movimentações (maior)
            const SizedBox(height: 16),
            _buildSkeletonCard(), // Histórico Completo
          ],
        ),
      ),
    );
  }

  // Helper para Títulos de Seção
  Widget _buildSectionTitle() {
    return Container(
      width: 100,
      height: 24,
      margin: const EdgeInsets.only(right: 250),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  // Helper para Botões (RegisterMovementButton)
  Widget _buildSkeletonButton() {
    return Container(
      height: 60, // Altura aproximada do seu botão de ação
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16), // Seguindo o padrão de botões
      ),
    );
  }

  // Helper para Cards (CardActionWidget / Preview)
  Widget _buildSkeletonCard({double height = 80}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          28,
        ), // O "Quadrado Arredondado" da logo
      ),
    );
  }
}
