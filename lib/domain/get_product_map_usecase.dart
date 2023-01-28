import 'cold_product_list_repository.dart';
import 'hot_product_list_repository.dart';
import 'model/product_domain.dart';

class GetProductMapUsecase {
  final HotProductListRepository _hotRepository;
  final ColdProductListRepository _coldRepository;

  GetProductMapUsecase(this._hotRepository, this._coldRepository);

  Future<Map<String, List<ProductDomain>>> getProductMap() async {
    final hotList = _getHotProducts();
    final coldList = _getColdProducts();
    final productList = [...await hotList, ...await coldList];

    return {
      for (var product in productList)
        product.category: productList
            .where((element) => element.category == product.category)
            .toList()
    };
  }

  Future<List<ProductDomain>> _getHotProducts() async {
    return (await _hotRepository.getHotProductList())
        .map((product) => ProductDomain(product.category, product.name))
        .toList();
  }

  Future<List<ProductDomain>> _getColdProducts() async {
    return (await _coldRepository.getColdProductList())
        .map((product) => ProductDomain(product.category, product.name))
        .toList();
  }
}
