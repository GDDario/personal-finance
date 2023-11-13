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

  factory Establishment.fromDatabase(Map<String, dynamic> map) => Establishment(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      type: EstablishmentType(
          id: map['establishment_type_id'],
          name: map['establishment_type_name']),
      createdAt: DateTime.parse(map['created_at']));
}
