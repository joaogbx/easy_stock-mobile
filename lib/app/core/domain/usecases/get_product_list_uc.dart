// 1. Definição da Classe
import 'package:easy_stock/app/core/data/models/product_model.dart';
import 'package:easy_stock/app/core/data/repositories/product_repository.dart';
import 'package:easy_stock/app/core/domain/repositories/i_product_repository.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductListUc {
  // 2. Dependência do Repositório (Contrato/Interface)
  final IProductRepository _iProductRepository;

  // 3. Construtor injetando a dependência
  GetProductListUc(this._iProductRepository);

  Future<Result> call() async {
    final response = await _iProductRepository.getAllProducts();

    return response;
  }
}
