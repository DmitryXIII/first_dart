import 'package:first_dart/data/dto/product_dto.dart';
import 'package:first_dart/data/remote_data_source_cold.dart';

import '../domain/cold_product_list_repository.dart';

class ColdProductListRepositoryImpl implements ColdProductListRepository {
  RemoteDataSourceCold dataSource;

  ColdProductListRepositoryImpl(this.dataSource);

  @override
  Future<List<ProductDto>> getColdProductList() async {
    return await dataSource.getProductList();
  }
}
