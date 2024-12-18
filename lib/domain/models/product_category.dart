import 'package:personal_finance/domain/models/generic_category.dart';

class ProductCategory extends GenericCategory {
  ProductCategory();

  ProductCategory.simple(id, name) : super.simple(id, name);
}
