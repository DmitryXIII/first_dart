import 'package:first_dart/data/dto/product_dto.dart';

abstract class ColdProductListRepository {
  Future<List<ProductDto>> getColdProductList();
}