import 'package:first_dart/data/dto/product_dto.dart';

abstract class HotProductListRepository {
  Future<List<ProductDto>> getHotProductList();
}