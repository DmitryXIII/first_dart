import '../data/product_list_repository.dart';
import 'model/product_domain.dart';

class GetProductMapUsecase {
  final ProductListRepository _repository;

  GetProductMapUsecase(this._repository);

  Map<String, List<ProductDomain>> getProductMap() {
    var list = _repository
        .getProductList()
        .map((product) => ProductDomain(product.category, product.name));

    // вариант 1: такой вариант написал я -> работает, но студия подчеркивает
    // и предлагает оптимизировать до варианта 2
    return Map.fromIterable(
        list,
        key: (product) => product.category,
        value: (product) => list
            .where((element) => element.category == product.category)
            .toList());

    // вариант 2: предложенный студией взамен моего
    // return { for (var e in list) e.category : list.where((element) => element.category == e.category).toList() };
  }
}
