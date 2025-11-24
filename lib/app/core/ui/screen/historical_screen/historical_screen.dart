import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/ui/screen/historical_screen/cubit/historical_cubit.dart';
import 'package:easy_stock/app/ui/components/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalScreen extends StatelessWidget {
  // Simulação de dados (mantido inalterado)
  final List<Map<String, String>> historico = [
    {
      'data': '20/10',
      'produto': 'Arroz',
      'tipo': 'Entrada',
      'quantidade': '50',
    },
    {
      'data': '21/10',
      'produto': 'Papel A4',
      'tipo': 'Saída',
      'quantidade': '20',
    },
    {
      'data': '21/10',
      'produto': 'Leite',
      'tipo': 'Entrada',
      'quantidade': '10',
    },
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
  ];

  // Definição da Paleta de Cores do Tema
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocBuilder<HistoricalCubit, HistoricalState>(
        builder: (context, state) {
          final stockMovements = state.stockMovements;
          return Scaffold(
            backgroundColor: backgroundColor,

            appBar: AppbarWidget(text: 'Minhas movimentações'),

            body: Container(
              // Adicionando padding para a lista
              padding: const EdgeInsets.only(top: 8.0),
              child: RefreshIndicator(
                onRefresh: () async {},
                child: ListView.builder(
                  itemCount: historico.length,
                  itemBuilder: (context, index) {
                    final item = historico[index];
                    final isEntrada = item['tipo'] == 'Entrada';
                    // Cores de status ajustadas para melhor contraste no fundo escuro
                    final color = isEntrada
                        ? Colors.greenAccent.shade400
                        : Colors.redAccent.shade400;

                    return ListTile(
                      // Cor de fundo levemente mais clara para o item da lista
                      tileColor: backgroundColor,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),

                      leading: Icon(
                        isEntrada ? Icons.arrow_upward : Icons.arrow_downward,
                        color: color,
                        size: 28,
                      ),

                      title: Text(
                        '${item['produto']} (${item['tipo']})',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor, // Texto do título em branco
                        ),
                      ),

                      subtitle: Text(
                        'Data: ${item['data']} | Quantidade: ${item['quantidade']}',
                        style: TextStyle(
                          color: textColor.withOpacity(
                            0.7,
                          ), // Subtítulo em cinza claro
                        ),
                      ),

                      trailing: Text(
                        '${isEntrada ? '+' : '-'}${item['quantidade']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: color, // Cor de status (Verde ou Vermelho)
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
    );
  }
}
