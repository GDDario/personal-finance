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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: ProductCategory.fromJson(json['category']),
      createdAt: DateTime.parse(json['creationDate']),
      updatedAt: json['updateDate'] != null
          ? DateTime.parse(json['updateDate'])
          : null,
      commumPrice: json['commumPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category.toJson(),
      'creationDate': createdAt.toIso8601String(),
      'updateDate': updatedAt?.toIso8601String(),
      'commumPrice': commumPrice,
    };
  }
}
