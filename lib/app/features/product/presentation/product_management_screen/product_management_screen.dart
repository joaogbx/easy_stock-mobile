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

  // 🚀 Lógica de deleção isolada para manter o build limpo
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
    final Color accentColor = ColorsPallete.secondaryPurple;

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
                child:
                    BlocBuilder<ProductManagementCubit, ProductManagementState>(
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

                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(16.0),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return ProductTile(
                              product: products[index],
                              onDelete: (product) =>
                                  _onConfirmDelete(context, product),
                              onEdit: (product) =>
                                  _showProductEditModal(context, product),
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
