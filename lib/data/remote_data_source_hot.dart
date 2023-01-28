import 'dart:math';

import 'package:first_dart/presentation/utils.dart';

import 'dto/product_dto.dart';

const _categoryTea = 'Чай';
const _categoryCoffee = 'Кофе';
const _americano = 'Американо';
const _latte = 'Латте';
const _cappuccino = 'Капучино';
const _black = 'Черный';
const _red = 'Красный';
const _green = 'Зеленый';
const _requiredProductsQuantity = 20;

class RemoteDataSourceHot {
  Future<List<ProductDto>> getProductList() {
    final serverResponseDelay = Random().nextInt(5) + 1;
    return Future.delayed(
            Duration(seconds: serverResponseDelay),
            () => List.generate(
                _requiredProductsQuantity, (_) => _getRandomProduct()))
        .whenComplete(() => logInDebug('HOT DELAY: $serverResponseDelay sec'));
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
      case _ProductCategory.categoryTea:
        return _TeaName.values[Random().nextInt(_TeaName.values.length)].name;
      case _ProductCategory.categoryCoffee:
        return _CoffeeName
            .values[Random().nextInt(_CoffeeName.values.length)].name;
    }
  }
}

enum _ProductCategory {
  categoryTea(_categoryTea),
  categoryCoffee(_categoryCoffee);

  final String name;

  const _ProductCategory(this.name);
}

enum _CoffeeName {
  americano(_americano),
  latte(_latte),
  cappuccino(_cappuccino);

  final String name;

  const _CoffeeName(this.name);
}

enum _TeaName {
  black(_black),
  red(_red),
  green(_green);

  final String name;

  const _TeaName(this.name);
}
