import 'package:easy_stock/app/features/product/data/model/product_model.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/components/input_select.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:easy_stock/app/features/product/presentation/product_management_screen/cubit/product_management_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductAddBottomSheet extends StatefulWidget {
  final Function() refreshProducts;
  const ProductAddBottomSheet({
    super.key,
    required this.refreshProducts,
  });
  @override
  State<ProductAddBottomSheet> createState() => _ProductAddBottomSheetState();
}

class _ProductAddBottomSheetState extends State<ProductAddBottomSheet> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? measureUnitSelected;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductManagementCubit>().state;
    final loading = state.loading;

    return BlocListener<ProductManagementCubit, ProductManagementState>(
      listenWhen: (previous, current) => previous.loading && !current.loading,
      listener: (context, state) {
        if (state.errorMessage == null) {
          Navigator.of(context).pop(true);

          showSnackBarFeedback(
            context: context,
            message: 'Produto adicionado com sucesso!',
            feedbackType: FeedbackType.success,
          );
          widget.refreshProducts();
        } else {
          Navigator.of(context).pop();
          showSnackBarFeedback(
            context: context,
            message: state.errorMessage!,
            feedbackType: FeedbackType.error,
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do produto';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (measureUnitSelected == null) {
                      return 'Por favor, selecione uma unidade de medida';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a quantidade';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Por favor, insira um número válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: loading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            final String name = _nameController.text;
                            final String quantity = _quantityController.text;

                            context
                                .read<ProductManagementCubit>()
                                .productRegistered(
                                  name,
                                  quantity,
                                  measureUnitSelected!,
                                );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsPallete.primaryPurple,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: loading
                      ? CircularProgressIndicator()
                      : Text(
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
        ),
      ),
    );
  }
}
