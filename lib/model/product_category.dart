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

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['creationDate']),
      updatedAt: json['updateDate'] != null
          ? DateTime.parse(json['updateDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'creationDate': createdAt.toIso8601String(),
      'updateDate': updatedAt?.toIso8601String(),
    };
  }
}
