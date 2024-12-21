abstract class Adjustment {
  late int id;
  late String name;
  late String description;
  late DateTime createdAt;
  late DateTime? updatedAt;

  Adjustment(this.id, this.name);

  String typeString();
}