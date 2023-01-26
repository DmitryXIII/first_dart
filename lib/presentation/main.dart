import 'package:first_dart/di/fake_di.dart';
import 'package:first_dart/domain/get_product_map_usecase.dart';

void main() {
  GetProductMapUsecase usecase = FakeDI().provideUsecase();

  var productsMap = usecase.getProductMap();

  productsMap.forEach((key, value) {
    print('=== КАТЕГОРИЯ: $key ===');
    productsMap[key]?.forEach((element) {
      print('продукт: ${element.category}, ${element.name}');
    });
  });
}
