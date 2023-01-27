import 'package:first_dart/data/dto/product_dto.dart';

import '../domain/product_list_repository.dart';
import 'remote_data_source.dart';

class ProductListRepositoryImpl implements ProductListRepository {
  RemoteDataSource dataSource;

  ProductListRepositoryImpl(this.dataSource);

  @override
  List<ProductDto> getProductList() {
    return dataSource.getProductList();
  }
}
