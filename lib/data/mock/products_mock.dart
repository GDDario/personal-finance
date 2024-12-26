import 'package:personal_finance/data/mock/categories_mock.dart';
import 'package:personal_finance/domain/models/product.dart';

final List<Product> productsMock = [
  Product.simple(1, '5kg rice', 25.00, categoriesMock.first),
  Product.simple(2, '3kg beans', 15.00, categoriesMock.first),
  Product.simple(3, '1kg beef', 20.00, categoriesMock.first),
  Product.simple(4, 'Lettuce', 3.00, categoriesMock.first),
];
