enum TransactionType {
  compra(1, "Compra"),
  pagamento(2, "Pagamento");

  const TransactionType(this.id, this.label);

  final int id;
  final String label;

  static fromJson(json) {

  }

  static toJson() {

  }
}
