import 'package:first_dart/data/dto/product_dto.dart';
import 'package:first_dart/presentation/utils.dart';

import '../domain/product_list_repository.dart';
import 'remote_data_source.dart';

class ProductListRepositoryImpl implements ProductListRepository {
  RemoteDataSource dataSource;

  ProductListRepositoryImpl(this.dataSource);

  @override
  Future<List<ProductDto>> getProductList() async {
    logInDebug('Старт запроса в репозитории');
    return await dataSource.getProductList();
  }
}
