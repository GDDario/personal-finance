class PaymentMethod {
  late int _id;
  late String _name;
  late DateTime _createdAt;
  late DateTime? _updatedAt;

  PaymentMethod(int id, String name, DateTime createdAt, DateTime? updatedAt) {
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _id = id;
  }

  PaymentMethod.simple(int id, String name) {
    _id = id;
    _name = name;
  }

  DateTime? get updatedAt => _updatedAt;

  set updatedAt(DateTime? value) {
    _updatedAt = value;
  }

  DateTime get createdAt => _createdAt;

  set createdAt(DateTime value) {
    _createdAt = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
