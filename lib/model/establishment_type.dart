class EstablishmentType {
  int id;
  String name;

  EstablishmentType({required this.id, required this.name});

  factory EstablishmentType.fromJson(Map<String, dynamic> json) {
    return EstablishmentType(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}