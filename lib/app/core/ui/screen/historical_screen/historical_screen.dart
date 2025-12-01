import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/ui/components/dialog_feedback.dart';
import 'package:easy_stock/app/core/ui/screen/historical_screen/cubit/historical_cubit.dart';
// Importação do estado
import 'package:easy_stock/app/ui/components/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart'; // Importação necessária para formatação de data

class HistoricalScreen extends StatelessWidget {
  // ... (Paleta de Cores e Cubit Injection mantidos)
  final Color backgroundColor = const Color.fromARGB(255, 20, 20, 20);
  final Color primaryColor = Colors.deepPurple.shade400; // Roxo principal
  final Color textColor = Colors.white; // Cor padrão do texto
  final Color cardColor = const Color.fromARGB(
    255,
    30,
    30,
    30,
  ); // Fundo dos items (opcional)

  final _cubit = getIt<HistoricalCubit>();

  HistoricalScreen({super.key}); // Adicionando construtor para melhor prática

  // Criando um formatador de data para ser usado na lista

  @override
  Widget build(BuildContext context) {
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
            // 1. Acessando a lista REAL de StockMovement
            final stockMovements = state.stockMovements;

            // Verificação de carregamento ou lista vazia (Opcional, mas recomendado)

            if (stockMovements.isEmpty && !state.loading) {
              return Scaffold(
                backgroundColor: backgroundColor,
                appBar: AppbarWidget(text: 'Minhas movimentações'),
                body: Center(
                  child: Text(
                    'Nenhuma movimentação encontrada.',
                    style: TextStyle(color: textColor.withOpacity(0.7)),
                  ),
                ),
              );
            }
            // --- Fim da Verificação ---

            return Scaffold(
              backgroundColor: backgroundColor,

              appBar: AppbarWidget(text: 'Minhas movimentações'),

              body: state.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RefreshIndicator(
                        // 2. Adicione a lógica de refresh ao Cubit
                        onRefresh: () async {
                          // Exemplo: _cubit.loadStockMovements();
                        },
                        child: ListView.builder(
                          itemCount: stockMovements.length,
                          itemBuilder: (context, index) {
                            // 3. O item agora é um objeto StockMovement
                            final item = stockMovements[index];

                            // 4. Acessando as propriedades diretamente
                            final isEntrada =
                                item.type == 'ENTRADA' ||
                                item.type == 'Entrada';
                            final color = isEntrada
                                ? Colors.greenAccent.shade400
                                : Colors.redAccent.shade400;

                            // 5. Formatando a data
                            //   final formattedDate = _dateFormat.format(item.createdAt);

                            return ListTile(
                              tileColor: backgroundColor,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),

                              leading: Icon(
                                isEntrada
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                color: color,
                                size: 28,
                              ),

                              // 6. Usando item.product.name e item.type
                              title: Text(
                                '${item.product.name} (${item.type})',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),

                              // 7. Usando formattedDate e item.quantity
                              //subtitle: Text(
                              //  'Data: $formattedDate | Quantidade: ${item.quantity}',
                              //  style: TextStyle(
                              //    color: textColor.withOpacity(0.7),
                              //  ),
                              //),

                              // 8. Usando item.quantity diretamente
                              trailing: Text(
                                '${isEntrada ? '+' : '-'}${item.quantity}',
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
}
