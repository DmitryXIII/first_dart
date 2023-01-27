import 'package:first_dart/di/fake_di.dart';
import 'package:first_dart/domain/get_product_map_usecase.dart';

import 'utils.dart';

void main() async {
  GetProductMapUsecase usecase = FakeDI().provideUsecase();
    logInDebug('Старт запроса в main()');
    var productsMap = await usecase.getProductMap();

    productsMap.forEach((key, value) {
      logInDebug('=== КАТЕГОРИЯ: $key ===');
      productsMap[key]?.forEach((element) {
        logInDebug('продукт: ${element.category} - ${element.name}');
      });
    });

  logInDebug('Финиш запроса в main()');
}
