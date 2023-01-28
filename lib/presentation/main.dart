import 'package:first_dart/di/fake_di.dart';
import 'package:first_dart/domain/get_product_map_usecase.dart';

import 'utils.dart';

void main() async {
  GetProductMapUsecase usecase = FakeDI().provideUsecase();
  logInDebug('СТАРТ ЗАПРОСА НА СЕРВЕР...');
  var productsMap = await usecase.getProductMap();
  int productsCount = 0;
  productsMap.forEach((key, value) {
    logInDebug('=== КАТЕГОРИЯ: $key ===');
    productsMap[key]?.forEach((element) {
      productsCount++;
      logInDebug('продукт: ${element.category} - ${element.name}');
    });
  });
  logInDebug('\nзагружено $productsCount продуктов');
}
