class ExpenseTableRowData {
  final String id;
  final String name;
  final String categoryName;
  double value;
  int quantity;
  double total;

  ExpenseTableRowData({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.value,
    this.quantity = 1,
    required this.total,
  });

  void incrementQuantity() {
    quantity++;
    total += value;
  }

  void changeValue(double newValue) {
    value = newValue;
    total = quantity * newValue;
  }

  void changeQuantity(int newQuantity) {
    quantity = newQuantity;
    total = quantity * value;
  }
}
