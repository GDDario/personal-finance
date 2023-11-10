import 'package:personal_finance/model/establishment_type.dart';

class Establishment {
  int id;
  String name;
  EstablishmentType type;
  DateTime createdAt;
  DateTime? editedAt;

  Establishment(
      {required this.id,
      required this.name,
      required this.type,
      required this.createdAt,
      this.editedAt});

  factory Establishment.fromJson(Map<String, dynamic> json) {
    return Establishment(
      id: json['id'],
      name: json['name'],
      type: EstablishmentType.fromJson(json['type']),
      createdAt: DateTime.parse(json['createdAt']),
      editedAt: json['editedAt'] != null
          ? DateTime.parse(json['editedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'editedAt': editedAt?.toIso8601String(),
    };
  }
}
