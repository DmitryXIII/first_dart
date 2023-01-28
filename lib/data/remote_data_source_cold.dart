import 'dart:math';

import 'package:first_dart/presentation/utils.dart';

import 'dto/product_dto.dart';

const _categoryDrinks = 'Напитки';
const _categoryYogurt = 'Молочные коктейли';
const _water = 'Вода';
const _limonade = 'Лимонад';
const _mors = 'Морс';
const _banana = 'Банановый';
const _wildberry = 'Дикая ягода';
const _apple = 'Яблочный';
const _requiredProductsQuantity = 20;

class RemoteDataSourceCold {
  Future<List<ProductDto>> getProductList() {
    final serverResponseDelay = Random().nextInt(5) + 1;
    return Future.delayed(
            Duration(seconds: serverResponseDelay),
            () => List.generate(
                _requiredProductsQuantity, (_) => _getRandomProduct()))
        .whenComplete(() => logInDebug('COLD DELAY: $serverResponseDelay sec'));
  }

  ProductDto _getRandomProduct() {
    final category = _getRandomCategory();
    final name = _getRandomProductName(category);
    return ProductDto(category: category.name, name: name);
  }

  _ProductCategory _getRandomCategory() {
    return _ProductCategory
        .values[Random().nextInt(_ProductCategory.values.length)];
  }

  String _getRandomProductName(_ProductCategory category) {
    switch (category) {
      case _ProductCategory.categoryDrinks:
        return _DrinkName
            .values[Random().nextInt(_DrinkName.values.length)].name;
      case _ProductCategory.categoryYogurt:
        return _MilkshakeName
            .values[Random().nextInt(_MilkshakeName.values.length)].name;
    }
  }
}

enum _ProductCategory {
  categoryDrinks(_categoryDrinks),
  categoryYogurt(_categoryYogurt);

  final String name;

  const _ProductCategory(this.name);
}

enum _DrinkName {
  water(_water),
  limonade(_limonade),
  mors(_mors);

  final String name;

  const _DrinkName(this.name);
}

enum _MilkshakeName {
  banana(_banana),
  wildberry(_wildberry),
  apple(_apple);

  final String name;

  const _MilkshakeName(this.name);
}
