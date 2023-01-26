import 'dart:math';

import 'dto/product_dto.dart';

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
      case _ProductCategoryConst._categoryTea:
        return _TeaName.values[Random().nextInt(_TeaName.values.length)].name;
      case _ProductCategoryConst._categoryCoffee:
        return _CoffeeName
            .values[Random().nextInt(_CoffeeName.values.length)].name;
      case _ProductCategoryConst._categoryDrinks:
        return _DrinkName
            .values[Random().nextInt(_DrinkName.values.length)].name;
      case _ProductCategoryConst._categoryYogurt:
        return _YogurtName
            .values[Random().nextInt(_YogurtName.values.length)].name;
      default:
        return "Unnamed";
    }
  }
}

enum _ProductCategory {
  categoryTea(_ProductCategoryConst._categoryTea),
  categoryCoffee(_ProductCategoryConst._categoryCoffee),
  categoryDrinks(_ProductCategoryConst._categoryDrinks),
  categoryYogurt(_ProductCategoryConst._categoryYogurt);

  final String name;

  const _ProductCategory(this.name);
}

enum _CoffeeName {
  americano('Американо'),
  latte('Латте'),
  cappuccino('Капучино');

  final String name;

  const _CoffeeName(this.name);
}

enum _TeaName {
  black('Черный'),
  red('Красный'),
  green('Зеленый');

  final String name;

  const _TeaName(this.name);
}

enum _DrinkName {
  water('Вода'),
  limonade('Лимонад'),
  mors('Морс');

  final String name;

  const _DrinkName(this.name);
}

enum _YogurtName {
  banana('Банановый'),
  wildberry('Дикая ягода'),
  apple('Яблочный');

  final String name;

  const _YogurtName(this.name);
}

class _ProductCategoryConst {
  static const _categoryTea = 'Чай';
  static const _categoryCoffee = 'Кофе';
  static const _categoryDrinks = 'Напитки';
  static const _categoryYogurt = 'Йогурт';
}
