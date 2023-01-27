import 'package:first_dart/data/dto/product_dto.dart';

abstract class ProductListRepository {
  Future<List<ProductDto>> getProductList();
}