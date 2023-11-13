import 'package:personal_finance/model/product_category.dart';

class Product {
  int id;
  String name;
  ProductCategory category;
  DateTime createdAt;
  DateTime? updatedAt;

  /// Calculated by calculating all ocurrences
  double commumPrice;

  Product(
      {required this.id,
      required this.name,
      required this.commumPrice,
      required this.category,
      required this.createdAt,
      this.updatedAt});
}
