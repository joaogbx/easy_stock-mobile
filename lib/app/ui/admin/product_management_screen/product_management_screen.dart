import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/data/models/product_model.dart';
import 'package:easy_stock/app/core/ui/components/button_widget.dart';
import 'package:easy_stock/app/core/ui/components/input_select.dart';
import 'package:easy_stock/app/core/ui/theme/colors_pallete.dart';
import 'package:easy_stock/app/ui/admin/product_management_screen/bottom_sheets/product_add_bottom_sheet.dart';
import 'package:easy_stock/app/ui/admin/product_management_screen/cubit/product_management_cubit.dart';
import 'package:easy_stock/app/ui/components/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductManagementScreen extends StatefulWidget {
  @override
  State<ProductManagementScreen> createState() =>
      _ProductManagementScreenState();
}

class _ProductManagementScreenState extends State<ProductManagementScreen> {
  final _cubit = getIt<ProductManagementCubit>();

  final List<Product> fakeProducts = [];

  String? measureUnitSelected;

  @override
  Widget build(BuildContext context) {
    final Color accentColor = ColorsPallete.secondaryPurple;

    return BlocProvider(
      create: (context) => _cubit,
      child: BlocBuilder<ProductManagementCubit, ProductManagementState>(
        builder: (context, state) {
          final products = state.products;
          return Scaffold(
            backgroundColor: ColorsPallete.darkBackground,
            appBar: AppbarWidget(text: 'Gerenciar Produtos'),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Produtos Cadastrados (${products.length} itens)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: accentColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return _buildProductTile(
                              context,
                              product.name,
                              'ID: ${product.id} | Unidade: ${product.measureUnit}',
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1, thickness: 0.6, color: Colors.white12),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                    left: 40,
                    right: 40,
                  ),
                  child: ButtonWidget(
                    onPressed: () {
                      _showProductAddModal(context);
                    },
                    text: 'ADICIONAR',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductTile(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ação de Edição para: $title'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ação de Exclusão para: $title'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showProductAddModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorsPallete.darkBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) => ProductAddBottomSheet(
        products: _cubit.state.products,
        productAddCallBack: (String name, String quantity, String measureUnit) {
          _cubit.productRegistered(name, quantity, measureUnit);
        },
      ),
    );
  }
}
