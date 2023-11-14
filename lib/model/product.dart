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

  factory Product.fromDatabase(Map<String, dynamic> map) => Product(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      category: ProductCategory(
        id: map['product_category_id'],
        name: map['product_category_name'],
        createdAt: DateTime.parse(map['product_category_created_at']),
      ),
      createdAt: DateTime.parse(map['created_at']),
      commumPrice: 0);
}
