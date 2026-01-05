// 1. Definição da Classe
import 'package:easy_stock/app/core/models/product_model.dart';
import 'package:easy_stock/app/features/product/data/repositorie/product_repository.dart';
import 'package:easy_stock/app/features/product/domain/i_product_repository.dart';
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
