import 'package:personal_finance/domain/models/generic_category.dart';

class GenericItem {
  late int id;
  late String name;
  late GenericCategory category;
  late DateTime createdAt;
  late DateTime? updatedAt;

  GenericItem(
      this.id, this.name, this.category, this.createdAt, this.updatedAt);

  GenericItem.simple(this.id, this.name, this.category);
}
