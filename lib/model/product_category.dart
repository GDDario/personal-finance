class ProductCategory {
  int id;
  String name;
  DateTime createdAt;
  DateTime? updatedAt;

  ProductCategory(
      {required this.id,
      required this.name,
      required this.createdAt,
      this.updatedAt});
}
