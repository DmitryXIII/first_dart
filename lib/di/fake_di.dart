import 'package:first_dart/data/product_list_repository.dart';
import 'package:first_dart/data/remote_data_source.dart';
import 'package:first_dart/domain/get_product_map_usecase.dart';

class FakeDI {
  provideUsecase() => GetProductMapUsecase(provideRepository());

  provideRepository() => ProductListRepository(provideDataSource());

  provideDataSource() => RemoteDataSource();
}
