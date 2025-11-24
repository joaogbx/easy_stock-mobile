import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/data/models/product_model.dart';
import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:easy_stock/app/core/ui/components/dialog_feedback.dart';
import 'package:easy_stock/app/core/ui/components/drag_handle.dart';
import 'package:easy_stock/app/core/ui/components/input_select.dart';
import 'package:easy_stock/app/core/ui/theme/colors_pallete.dart';
import 'package:easy_stock/app/ui/employee/register_movement/cubit/register_movement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterMovement extends StatefulWidget {
  final RegisterMode registerMode;
  final Function() onSuccess;
  RegisterMovement({
    super.key,
    required this.registerMode,
    required this.onSuccess,
  });

  @override
  State<RegisterMovement> createState() => _RegisterMovementState();
}

class _RegisterMovementState extends State<RegisterMovement> {
  String get type =>
      widget.registerMode == RegisterMode.stockIn ? 'ENTRADA' : 'SAÍDA';

  Color get _buttonColor => type == 'ENTRADA' ? Colors.green : Colors.redAccent;

  final cubit = getIt<RegisterMovementCubit>();

  final _quantityController = TextEditingController();

  Product? _productSelected;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<RegisterMovementCubit, RegisterMovementState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showSnackBarFeedback(
              context: context,
              message: state.errorMessage!,
              feedbackType: FeedbackType.error,
            );
          }
        },
        child: BlocBuilder<RegisterMovementCubit, RegisterMovementState>(
          builder: (context, state) {
            final products = state.products;
            bool loading = state.loading;
            return Column(
              children: [
                DragHandle(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Detalhes da $type',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomSelectInput<Product>(
                          labelText: 'Selecione um produto',
                          items: products,
                          value: _productSelected,
                          itemLabelBuilder: (product) {
                            return product.name;
                          },
                          onItemSelected: (product) {
                            _productSelected = product;
                            setState(() {});
                          },
                          prefixIcon: Icons.abc,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          enabled: _productSelected != null,
                          controller: _quantityController,
                          decoration: InputDecoration(
                            labelText: 'Quantidade',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.numbers),
                          ),
                          keyboardType: TextInputType.number,

                          validator: (value) {
                            if (widget.registerMode == RegisterMode.stockOut) {
                              return validatorStockOut(value);
                            } else {
                              return validatorStockIn(value);
                            }
                          },
                        ),
                        SizedBox(height: 16),

                        SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _buttonColor,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.submitMovementForm(
                                _productSelected!.id,
                                _quantityController.text,
                                onSuccess,
                              );
                            }

                            //ScaffoldMessenger.of(context).showSnackBar(
                            //  SnackBar(
                            //    content: Text('$type registrada com sucesso!'),
                            //    backgroundColor: _buttonColor,
                            //  ),
                            //);
                            //Navigator.pop(context);
                          },
                          child: loading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check_circle_outline),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('CONFIRMAR ${type}'),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  onSuccess() {
    Navigator.of(context).pop();
    showSnackBarFeedback(
      context: context,
      message: '${type} registrada com sucesso!',
      feedbackType: FeedbackType.success,
    );
  }

  String? validatorStockOut(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a quantidade.';
    }

    final int? quantity = int.tryParse(value);

    if (quantity == null) {
      return 'Insira um número válido.';
    }

    if (quantity > _productSelected!.quantity) {
      return 'Quantidade máxima disponível em estoque: ${_productSelected!.quantity}.';
    }

    return null;
  }

  String? validatorStockIn(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a quantidade.';
    }

    final int? quantity = int.tryParse(value);

    if (quantity == null) {
      return 'Insira um número válido.';
    }

    return null;
  }
}
