import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/features/stock/presentation/movements_screen/cubit/historical_cubit.dart';
import 'package:easy_stock/app/shared/components/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:intl/intl.dart';

class HistoricalMovementScreen extends StatefulWidget {
  const HistoricalMovementScreen({
    super.key,
  });

  @override
  State<HistoricalMovementScreen> createState() =>
      _HistoricalMovementScreenState();
}

class _HistoricalMovementScreenState extends State<HistoricalMovementScreen> {
  final _cubit = getIt<HistoricalCubit>();
  final _appCubit = getIt<AppCubit>();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _cubit.initData();
  }

  @override
  Widget build(BuildContext context) {
    final userRole = _appCubit.state.userlogged!.role;
    final bool isAdmin = userRole == 'ADMIN';
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<HistoricalCubit, HistoricalState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showSnackBarFeedback(
              context: context,
              message: state.errorMessage!,
              feedbackType: FeedbackType.error,
            );
          }
        },
        child: BlocBuilder<HistoricalCubit, HistoricalState>(
          builder: (context, state) {
            final stockMovements = state.stockMovements;

            bool isFilteredByDate = _startDate != null && _endDate != null;

            List<Widget> actions = [];
            if (isAdmin) {
              if (isFilteredByDate) {
                actions.add(
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _clearFilters,
                    tooltip: 'Limpar Filtro',
                  ),
                );
              }
              actions.add(
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: _showDateRangePicker,
                  tooltip: 'Filtrar por Data',
                ),
              );
            }

            String appbarTitle;
            if (isAdmin && isFilteredByDate) {
              appbarTitle =
                  '${_dateFormat.format(_startDate!)} - ${_dateFormat.format(_endDate!)}';
            } else if (isAdmin) {
              appbarTitle = 'Movimentações (Geral)';
            } else {
              appbarTitle = 'Minhas Movimentações';
            }

            if (state.loading) {
              return Scaffold(
                backgroundColor: ColorsPallete.darkBackground,
                appBar: AppbarWidget(
                  text: appbarTitle,
                  actions: actions,
                ),
                body: Center(
                  child: CircularProgressIndicator(
                    color: ColorsPallete.primaryPurple,
                  ),
                ),
              );
            }

            if (stockMovements.isEmpty && !state.loading) {
              return Scaffold(
                backgroundColor: ColorsPallete.darkBackground,
                appBar: AppbarWidget(
                  text: appbarTitle,
                  actions: actions,
                ),
                body: Center(
                  child: Text(
                    'Nenhuma movimentação encontrada.',
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).textTheme.bodyMedium?.color?.withOpacity(0.7) ??
                          Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
              );
            }

            return Scaffold(
              backgroundColor: ColorsPallete.darkBackground,
              appBar: AppbarWidget(
                text: appbarTitle,
                actions: actions,
              ),
              body: Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    _cubit.initData();
                    setState(() {
                      _startDate = null;
                      _endDate = null;
                    });
                  },
                  child: ListView.builder(
                    itemCount: stockMovements.length,
                    itemBuilder: (context, index) {
                      final item = stockMovements[index];

                      final isEntry = item.type == 'STOCK_IN';

                      final color = isEntry
                          ? Colors.greenAccent.shade400
                          : Colors.redAccent.shade400;

                      final formattedDate = DateFormat(
                        'dd/MM/yyyy HH:mm',
                      ).format(item.createdAt);

                      return ListTile(
                        tileColor: ColorsPallete.darkBackground,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        leading: Icon(
                          isEntry ? Icons.arrow_upward : Icons.arrow_downward,
                          color: color,
                          size: 28,
                        ),
                        title: Text(
                          item.product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).textTheme.titleMedium?.color,
                          ),
                        ),

                        subtitle: Text(
                          formattedDate,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                        ),

                        trailing: Text(
                          '${isEntry ? '+' : '-'}${item.quantity}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: color,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showDateRangePicker() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(start: _startDate!, end: _endDate!)
          : null,
      confirmText: 'Aplicar',
      builder: (context, child) {
        return child!;
      },
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = DateTime(
          picked.end.year,
          picked.end.month,
          picked.end.day,
          23,
          59,
          59,
          999,
        );
      });

      _cubit.getAllStockMovements(
        startDate: _startDate!.toIso8601String(),
        endDate: _endDate!.toIso8601String(),
      );
    }
  }

  void _clearFilters() {
    setState(() {
      _startDate = null;
      _endDate = null;
    });
    _cubit.initData();
  }
}
