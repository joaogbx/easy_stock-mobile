import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/models/product_model.dart';
import 'package:easy_stock/app/shared/components/custom_refresh_indicator.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/features/components/appbar_widget.dart';
import 'package:easy_stock/app/features/stock/presentation/cubit/stock_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockScreen extends StatefulWidget {
  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final cubit = getIt<StockCubit>();

  @override
  void initState() {
    cubit.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const Color textoPrincipal = Colors.white;
    const Color textoSecundario = Colors.white70;

    final Color primaryColor = Theme.of(context).primaryColor;

    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<StockCubit, StockState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showSnackBarFeedback(
              context: context,
              message: state.errorMessage!,
              feedbackType: FeedbackType.error,
            );
          }
        },
        child: BlocBuilder<StockCubit, StockState>(
          builder: (context, state) {
            List<Product> products = state.products;
            bool loading = state.loading;
            return Scaffold(
              appBar: AppbarWidget(text: 'Estoque atual'),
              backgroundColor: const Color.fromARGB(255, 20, 20, 20),
              body: CustomRefreshIndicator(
                onRefresh: () async {
                  cubit.initData();
                },
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        itemCount: products.length,
                        separatorBuilder: (context, index) => const Divider(
                          height: 1,
                          indent: 16,
                          endIndent: 16,
                          color: Colors.white12,
                        ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: primaryColor.withOpacity(
                                0.15,
                              ),
                              child: Text(
                                '${product.quantity}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            title: Text(
                              product.name,
                              style: const TextStyle(color: textoPrincipal),
                            ),
                            subtitle: Text(
                              'Unidade: ${product.measureUnit}',
                              style: const TextStyle(color: textoSecundario),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right,
                              color: textoSecundario,
                            ),
                            onTap: () {
                              // Ação para ver detalhes do produto
                            },
                          );
                        },
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
