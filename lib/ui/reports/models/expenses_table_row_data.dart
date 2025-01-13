class ExpensesTableRowData {
  late int id;
  late String establishment;
  late int itemsNumber;
  late double totalItems;
  late int adjustmentsNumber;
  late double totalAdditions;
  late double totalDiscounts;
  late int attachmentsNumber;
  late double total;
  late DateTime dateTime;

  ExpensesTableRowData(
      this.id,
      this.establishment,
      this.itemsNumber,
      this.totalItems,
      this.adjustmentsNumber,
      this.totalAdditions,
      this.totalDiscounts,
      this.attachmentsNumber,
      this.total,
      this.dateTime);
}
