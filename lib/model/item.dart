import 'package:personal_finance/model/product.dart';

class Item {
  int? id;
  Product product;
  double price;
  int quantity;
  double total;

  Item(
      {this.id,
      required this.product,
      required this.price,
      required this.quantity,
      required this.total});

  void calculateTotal() {
    total = price * quantity;
  }
}
