import 'package:first_dart/data/dto/product_dto.dart';
import 'remote_data_source.dart';

class ProductListRepository {
  RemoteDataSource dataSource;

  ProductListRepository(this.dataSource);

  List<ProductDto> getProductList() {
    return dataSource.getProductList();
  }
}