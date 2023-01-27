import 'dart:math';

import 'dto/product_dto.dart';

const _categoryTea = 'Чай';
const _categoryCoffee = 'Кофе';
const _categoryDrinks = 'Напитки';
const _categoryYogurt = 'Йогурт';
const _americano = 'Американо';
const _latte = 'Латте';
const _cappuccino = 'Капучино';
const _black = 'Черный';
const _red = 'Красный';
const _green = 'Зеленый';
const _water = 'Вода';
const _limonade = 'Лимонад';
const _mors = 'Морс';
const _banana = 'Банановый';
const _wildberry = 'Дикая ягода';
const _apple = 'Яблочный';
const _requiredProductsQuantity = 100;

class RemoteDataSource {
  List<ProductDto> getProductList() {
    return List.generate(_requiredProductsQuantity, (_) => _getRandomProduct());
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
      case _ProductCategory.categoryDrinks:
        return _DrinkName
            .values[Random().nextInt(_DrinkName.values.length)].name;
      case _ProductCategory.categoryYogurt:
        return _YogurtName
            .values[Random().nextInt(_YogurtName.values.length)].name;
    }
  }
}

enum _ProductCategory {
  categoryTea(_categoryTea),
  categoryCoffee(_categoryCoffee),
  categoryDrinks(_categoryDrinks),
  categoryYogurt(_categoryYogurt);

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

enum _DrinkName {
  water(_water),
  limonade(_limonade),
  mors(_mors);

  final String name;

  const _DrinkName(this.name);
}

enum _YogurtName {
  banana(_banana),
  wildberry(_wildberry),
  apple(_apple);

  final String name;

  const _YogurtName(this.name);
}
