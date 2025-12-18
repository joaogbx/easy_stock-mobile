import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/data/models/product_model.dart';
import 'package:easy_stock/app/core/ui/components/app_dialog.dart';
import 'package:easy_stock/app/core/ui/components/button_widget.dart';
import 'package:easy_stock/app/core/ui/components/dialog_feedback.dart';
import 'package:easy_stock/app/core/ui/components/input_select.dart';
import 'package:easy_stock/app/core/ui/theme/colors_pallete.dart';
import 'package:easy_stock/app/ui/admin/product_management_screen/bottom_sheets/product_add_bottom_sheet.dart';
import 'package:easy_stock/app/ui/admin/product_management_screen/bottom_sheets/product_edit_bottom_sheet.dart';
import 'package:easy_stock/app/ui/admin/product_management_screen/components/product_tile.dart';
import 'package:easy_stock/app/ui/admin/product_management_screen/cubit/product_management_cubit.dart';
import 'package:easy_stock/app/ui/components/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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
            // 🚀 NOVA IMPLEMENTAÇÃO: RefreshIndicator
            body: RefreshIndicator(
              color: ColorsPallete.primaryPurple,
              backgroundColor: ColorsPallete.darkSecondary,
              onRefresh: () async {
                _refreshProducts();
              },
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
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
                              return ProductTile(
                                onDelete: (product) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (modalContext) =>
                                        BlocConsumer<
                                          ProductManagementCubit,
                                          ProductManagementState
                                        >(
                                          bloc: _cubit,
                                          listenWhen: (previous, current) =>
                                              previous.loading &&
                                              !current.loading,
                                          listener: (context, state) {
                                            if (Navigator.of(
                                              modalContext,
                                            ).canPop()) {
                                              Navigator.of(modalContext).pop();
                                            }

                                            if (state.errorMessage != null) {
                                              showSnackBarFeedback(
                                                context: context,
                                                message: state.errorMessage!,
                                                feedbackType:
                                                    FeedbackType.error,
                                              );
                                            } else {
                                              _refreshProducts();
                                              showSnackBarFeedback(
                                                context: context,
                                                message:
                                                    "Produto excluído com sucesso!",
                                                feedbackType:
                                                    FeedbackType.success,
                                              );
                                            }
                                          },
                                          builder: (context, state) {
                                            return AppDialog(
                                              title: 'Excluir',
                                              subtitle:
                                                  'Deseja excluir ${product.name}?',
                                              confirmText: 'Excluir',
                                              confirmColor: Colors.redAccent,
                                              loading: state.loading,
                                              onConfirm: () => _cubit
                                                  .productDelete(product.id),
                                            );
                                          },
                                        ),
                                  );
                                },
                                onEdit: (product) {
                                  _showProductEditModal(context, product);
                                },
                                product: product,
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 0.6,
                    color: Colors.white12,
                  ),
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
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductTile(
    BuildContext context,
    Product product,
  ) {
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
            onPressed: () {
              _showProductEditModal(context, product);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {
              showDialog(
                context: context,

                builder: (context) => AppDialog(
                  title: 'Excluir Produto',

                  subtitle:
                      'Tem certeza que deseja excluir ${product.name}? Esta ação não pode ser desfeita.',
                  confirmText: 'Excluir',
                  confirmColor: Colors.redAccent, // Cor de alerta/perigo
                  onConfirm: () {
                    // Aqui você chamaria o seu cubit
                    _cubit.productDelete(product.id);
                  },
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
      builder: (BuildContext context) => BlocProvider.value(
        value: _cubit,
        child: ProductAddBottomSheet(
          products: _cubit.state.products,
          productAddCallBack:
              (String name, String quantity, String measureUnit) {
                _cubit.productRegistered(name, quantity, measureUnit);
              },
        ),
      ),
    ).then((value) {
      if (value == true) {
        _refreshProducts();
      }
    });
  }

  void _refreshProducts() {
    _cubit.initData();
  }

  void _showProductEditModal(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorsPallete.darkBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => BlocProvider.value(
        value: _cubit,
        child: ProductEditBottomSheet(
          product: product,
          refresh: _refreshProducts,
        ),
      ),
    ).then((value) {
      if (value == true) {
        showSnackBarFeedback(
          context: context,
          message: 'Produto atualizado',
          feedbackType: FeedbackType.success,
        );
      }
    });
  }
}
