import 'package:easy_stock/app/core/models/product_model.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:easy_stock/app/features/product/presentation/product_management_screen/cubit/product_management_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final Function(Product) onEdit;
  final Function(Product) onDelete;

  const ProductTile({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        product.name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        'ID: ${product.id} | Unidade: ${product.measureUnit}',
        style: TextStyle(color: Colors.white.withOpacity(0.7)),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: ColorsPallete.secondaryPurple,
            ),
            onPressed: () => onEdit(product),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () => onDelete(product),
          ),
        ],
      ),
    );
  }
}
