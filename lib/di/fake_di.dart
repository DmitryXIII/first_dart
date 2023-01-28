import 'package:first_dart/data/hot_product_list_repository_impl.dart';
import 'package:first_dart/data/remote_data_source_cold.dart';
import 'package:first_dart/data/remote_data_source_hot.dart';
import 'package:first_dart/domain/get_product_map_usecase.dart';

import '../data/cold_product_list_repository_impl.dart';

class FakeDI {
  provideUsecase() =>
      GetProductMapUsecase(provideHotRepository(), provideColdRepository());

  provideHotRepository() =>
      HotProductListRepositoryImpl(provideDataSourceHot());

  provideColdRepository() =>
      ColdProductListRepositoryImpl(provideDataSourceCold());

  provideDataSourceHot() => RemoteDataSourceHot();

  provideDataSourceCold() => RemoteDataSourceCold();
}
