import 'package:first_dart/data/dto/product_dto.dart';

import '../domain/hot_product_list_repository.dart';
import 'remote_data_source_hot.dart';

class HotProductListRepositoryImpl implements HotProductListRepository {
  RemoteDataSourceHot dataSource;

  HotProductListRepositoryImpl(this.dataSource);

  @override
  Future<List<ProductDto>> getHotProductList() async {
    return await dataSource.getProductList();
  }
}
