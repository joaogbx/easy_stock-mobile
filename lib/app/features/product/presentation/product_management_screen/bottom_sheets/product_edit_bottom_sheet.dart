import 'package:easy_stock/app/core/models/product_model.dart';
import 'package:easy_stock/app/shared/components/button_widget.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/components/input_select.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:easy_stock/app/features/product/presentation/product_management_screen/cubit/product_management_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductEditBottomSheet extends StatefulWidget {
  final Product product;
  final Function() refreshProducts;

  const ProductEditBottomSheet({
    super.key,
    required this.product,
    required this.refreshProducts,
  });
  @override
  State<ProductEditBottomSheet> createState() => _ProductEditBottomSheetState();
}

class _ProductEditBottomSheetState extends State<ProductEditBottomSheet> {
  final _nameController = TextEditingController();
  String? measureUnitSelected;
  void initState() {
    super.initState();
    _nameController.text = widget.product.name;
    measureUnitSelected = widget.product.measureUnit;
  }

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
            message: 'Produto editado com sucesso!',
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
                'Editar produto',
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
                labelText: 'Unidade de medida',
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
              const SizedBox(height: 40),

              ButtonWidget(
                onPressed: () {
                  final form = {
                    'name': _nameController.text,
                    'measure_unit': measureUnitSelected,
                  };

                  context.read<ProductManagementCubit>().productEdit(
                    widget.product.id,
                    form,
                  );
                },
                loading: loading,
                text: 'Editar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
