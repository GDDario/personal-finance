abstract class Adjustment {
  late int id;
  late String name;
  late String description;
  late DateTime createdAt;
  late DateTime? updatedAt;

  double value = 0;

  Adjustment(this.id, this.name);
  Adjustment.withValue(this.id, this.name, this.value);

  String typeString();
}
