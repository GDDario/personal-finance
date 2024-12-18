import 'package:personal_finance/domain/models/generic_item.dart';
import 'package:personal_finance/domain/models/product_category.dart';

class Product extends GenericItem {
  late double price;

  Product(
      int id,
      String name,
      ProductCategory category,
      DateTime createdAt,
      DateTime? updatedAt,
      this.price,
      ) : super(id, name, category, createdAt, updatedAt);

  Product.simple(
      int id,
      String name,
      this.price,
      ProductCategory category,
      ) : super.simple(id, name, category);
}