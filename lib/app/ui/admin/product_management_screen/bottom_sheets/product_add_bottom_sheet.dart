import 'package:easy_stock/app/core/data/models/product_model.dart';
import 'package:easy_stock/app/core/ui/components/input_select.dart';
import 'package:easy_stock/app/core/ui/theme/colors_pallete.dart';
import 'package:easy_stock/app/ui/admin/product_management_screen/cubit/product_management_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductAddBottomSheet extends StatefulWidget {
  final List<Product> products;
  final Function(String name, String quantity, String unitMeasure)
  productAddCallBack;
  const ProductAddBottomSheet({
    super.key,
    required this.products,
    required this.productAddCallBack,
  });
  @override
  State<ProductAddBottomSheet> createState() => _ProductAddBottomSheetState();
}

class _ProductAddBottomSheetState extends State<ProductAddBottomSheet> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  String? measureUnitSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Adicionar Novo Produto',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nome do Produto',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Ex: Café Torrado',
              ),
            ),
            const SizedBox(height: 20),
            CustomSelectInput<String>(
              labelText: 'Selecione uma unidade de medida',
              items: const ['Unidade', 'Litro', 'Kg'],

              value: measureUnitSelected,
              itemLabelBuilder: (product) {
                return product;
              },
              onItemSelected: (product) {
                setState(() {
                  measureUnitSelected = product;
                });
              },
              prefixIcon: Icons.straighten,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Quantidade em Estoque',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Ex: 150',
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                final String name = _nameController.text;
                final String quantity = _quantityController.text;

                widget.productAddCallBack(name, quantity, measureUnitSelected!);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsPallete.primaryPurple,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'ADICIONAR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
