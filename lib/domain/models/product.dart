import 'package:personal_finance/domain/models/generic_item.dart';
import 'package:personal_finance/domain/models/product_category.dart';

class Product extends GenericItem {
  late ProductCategory category;

  Product(
      super.id, super.name, this.category, super.createdAt, super.updatedAt);
}
