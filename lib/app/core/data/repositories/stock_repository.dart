import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/data/datasource/stock_datasource.dart';
import 'package:easy_stock/app/core/data/models/stock_movement.dart';
import 'package:easy_stock/app/core/domain/repositories/i_stock_reposittory.dart';
import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IStockRepository)
class StockRepository implements IStockRepository {
  final StockDatasource _stockDatasource;

  StockRepository(this._stockDatasource);

  @override
  Future<Result> createMovement({
    required int productId,
    required int quantity,
    required RegisterMode registerMode,
  }) async {
    try {
      final type = registerMode == RegisterMode.stockIn
          ? 'STOCK_IN'
          : 'STOCK_OUT';
      final payload = {
        'quantity': quantity,
        'type': type,
      };

      final response = await _stockDatasource.createMovement(
        payload: payload,
        productId: productId,
      );

      return Result.success(StockMovement.fromJson(response['data']));
    } on DioException catch (error) {
      return Result.error(
        'Erro ao registrar movimentação, ${error.response?.data['message'] ?? error.message}',
      );
    } catch (error) {
      return Result.error(
        'Erro desconhecido ao registrar movimentação, $error',
      );
    }
  }

  @override
  Future<Result> gettAllStockMovements({Map<String, dynamic>? query}) async {
    try {
      final response = await _stockDatasource.gettAllStockMovements(query);

      final List<StockMovement> stockMovements = (response['data'] as List)
          .map((item) => StockMovement.fromJson(item as Map<String, dynamic>))
          .toList();

      return Result.success(stockMovements);
    } on DioException catch (error) {
      return Result.error(
        error.response?.data['message'] ??
            error.message ??
            'Erro ao buscar histórico de movimentações',
      );
    } catch (error) {
      return Result.error(
        'Erro desconhecido ao buscar histórico de movimentações: $error',
      );
    }
  }
}
