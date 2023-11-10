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

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      product: Product.fromJson(json['product']),
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'price': price,
      'quantity': quantity,
      'total': total,
    };
  }

  void calculateTotal() {
    total = price * quantity;
  }
}
