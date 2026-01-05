import 'package:easy_stock/app/core/models/stock_movement.dart';
import 'package:flutter/material.dart';

class MovementsPreviewWidget extends StatelessWidget {
  const MovementsPreviewWidget({super.key, required this.stockMovements});

  final List<StockMovement> stockMovements;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(
          255,
          35,
          35,
          35,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: stockMovements!.length,
        itemBuilder: (context, index) {
          final movement = stockMovements[index];
          final product = movement.product;

          final isStockIn = movement.type == 'STOCK_IN';
          final color = isStockIn ? Colors.green.shade400 : Colors.red.shade400;

          final movementType = movement.type == 'STOCK_IN'
              ? 'Entrada'
              : 'Saída';

          return Column(
            children: [
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                leading: Icon(
                  isStockIn ? Icons.arrow_upward : Icons.arrow_downward,
                  color: color,
                  size: 20,
                ),
                title: Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  '${movement.createdAt.day}/ ${movement.createdAt.month} | $movementType',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
                trailing: Text(
                  '${isStockIn ? '+' : '-'}${movement.quantity}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
