class PaymentSubtype {
  int id;
  String name;
  DateTime createdAt;

  PaymentSubtype({required this.id, required this.name, required this.createdAt});

  factory PaymentSubtype.fromJson(Map<String, dynamic> json) {
    return PaymentSubtype(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}