import 'package:first_dart/presentation/utils.dart';

import 'model/product_domain.dart';
import 'product_list_repository.dart';

class GetProductMapUsecase {
  final ProductListRepository _repository;

  GetProductMapUsecase(this._repository);

  Future<Map<String, List<ProductDomain>>> getProductMap() async {
    logInDebug('Старт запроса в usecase');

    var productList = (await _repository.getProductList())
        .map((product) => ProductDomain(product.category, product.name))
        .toList();

    logInDebug('Финиш запроса в usecase');

    return {
      for (var product in productList)
        product.category: productList
            .where((element) => element.category == product.category)
            .toList()
    };
  }
}
