import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/features/product/data/model/product_model.dart';
import 'package:easy_stock/app/shared/components/app_dialog.dart';
import 'package:easy_stock/app/shared/components/button_widget.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:easy_stock/app/features/product/presentation/product_management_screen/bottom_sheets/product_add_bottom_sheet.dart';
import 'package:easy_stock/app/features/product/presentation/product_management_screen/bottom_sheets/product_edit_bottom_sheet.dart';
import 'package:easy_stock/app/features/product/presentation/product_management_screen/components/product_tile.dart';
import 'package:easy_stock/app/features/product/presentation/product_management_screen/cubit/product_management_cubit.dart';
import 'package:easy_stock/app/shared/components/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_stock/app/features/product/data/model/product_model.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';

class ProductManagementScreen extends StatefulWidget {
  @override
  State<ProductManagementScreen> createState() =>
      _ProductManagementScreenState();
}

class _ProductManagementScreenState extends State<ProductManagementScreen> {
  final _cubit = getIt<ProductManagementCubit>();

  @override
  void initState() {
    super.initState();
    _refreshProducts();
  }

  void _refreshProducts() {
    _cubit.initData();
  }

  void _onConfirmDelete(BuildContext context, Product product) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (modalContext) =>
          BlocConsumer<ProductManagementCubit, ProductManagementState>(
            bloc: _cubit,
            listenWhen: (previous, current) =>
                previous.loading && !current.loading,
            listener: (context, state) {
              final navigator = Navigator.of(modalContext);

              if (navigator.canPop()) {
                navigator.pop();
              }

              if (state.errorMessage != null) {
                showSnackBarFeedback(
                  context: context,
                  message: state.errorMessage!,
                  feedbackType: FeedbackType.error,
                );
              } else {
                _refreshProducts();
                showSnackBarFeedback(
                  context: context,
                  message: "Produto excluído com sucesso!",
                  feedbackType: FeedbackType.success,
                );
              }
            },
            builder: (context, state) {
              return AppDialog(
                title: 'Excluir',
                subtitle: 'Deseja realmente excluir ${product.name}?',
                confirmText: 'Excluir',
                confirmColor: Colors.redAccent,
                loading: state.loading,
                onConfirm: () => _cubit.productDelete(product.id),
              );
            },
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
          refreshProducts: _refreshProducts,
        ),
      ),
    );
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
          refreshProducts: _refreshProducts,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: ColorsPallete.darkBackground,
        appBar: AppbarWidget(text: 'Gerenciar Produtos'),
        body: RefreshIndicator(
          color: ColorsPallete.primaryPurple,
          backgroundColor: ColorsPallete.darkSecondary,
          onRefresh: () async => _refreshProducts(),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ProductManagementCubit, ProductManagementState>(
                  builder: (context, state) {
                    final products = state.products;

                    if (products.isEmpty && !state.loading) {
                      return const Center(
                        child: Text(
                          'Nenhum produto cadastrado.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      );
                    }

                    // 🚀 Alterado para ListView.separated para incluir a linha divisória (Divider)
                    return ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16.0),
                      itemCount: products.length,
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.white12,
                        height: 1,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductTile(
                          product: product,
                          // 🚀 O trailing (três pontos) agora é injetado ou tratado internamente no ProductTile
                          trailing: PopupMenuButton<String>(
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white70,
                            ),
                            color: ColorsPallete.darkSecondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onSelected: (value) {
                              if (value == 'edit') {
                                _showProductEditModal(context, product);
                              } else if (value == 'delete') {
                                _onConfirmDelete(context, product);
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Editar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Excluir',
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
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
                  onPressed: () => _showProductAddModal(context),
                  text: 'ADICIONAR',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// lib/app/features/product/presentation/product_management_screen/components/product_tile.dart

class ProductTile extends StatelessWidget {
  final Product product;
  final Widget? trailing; // Recebe o PopupMenuButton da tela principal

  const ProductTile({
    super.key,
    required this.product,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),

      // Ícone com fundo roxo suave igual ao de usuários
      leading: CircleAvatar(
        backgroundColor: ColorsPallete.primaryPurple.withOpacity(0.15),
        child: Icon(
          Icons.inventory_2_outlined,
          color: ColorsPallete.primaryPurple,
          size: 24,
        ),
      ),

      // Nome do Produto
      title: Text(
        product.name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),

      // Quantidade e Unidade de Medida
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          'Estoque: ${product.quantity} ${product.measureUnit}',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
      ),

      // Os três pontos (PopupMenuButton) injetados pela Screen
      trailing: trailing,
    );
  }
}
