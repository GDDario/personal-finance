class PaymentMethod {
  late int id;
  late String name;
  late DateTime createdAt;
  late DateTime? updatedAt;

  PaymentMethod(this.id, this.name, this.createdAt, this.updatedAt);

  PaymentMethod.simple(this.id, this.name);
}
