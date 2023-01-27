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
const _defaultName = 'Йогурт';

class RemoteDataSource {
  List<ProductDto> getProductList() {

    List<ProductDto> result = [];
    for (int i = 0; i < 100; i++) {
      var category = _getRandomCategory();
      var name = _getRandomProductName(category);
      result.add(ProductDto(category: category, name: name));
    }
    return result;
  }

  String _getRandomCategory() {
    return _ProductCategory
        .values[Random().nextInt(_ProductCategory.values.length)].name;
  }

  String _getRandomProductName(String category) {
    switch (category) {
      case _categoryTea:
        return _TeaName.values[Random().nextInt(_TeaName.values.length)].name;
      case _categoryCoffee:
        return _CoffeeName
            .values[Random().nextInt(_CoffeeName.values.length)].name;
      case _categoryDrinks:
        return _DrinkName
            .values[Random().nextInt(_DrinkName.values.length)].name;
      case _categoryYogurt:
        return _YogurtName
            .values[Random().nextInt(_YogurtName.values.length)].name;
      default:
        return _defaultName;
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
