import 'package:personal_finance/enum/transaction_type.dart';
import 'package:personal_finance/model/establishment.dart';
import 'package:personal_finance/model/item.dart';
import 'package:personal_finance/model/payment.dart';

class Transaction {
  int? id;
  double total = 0;
  double discount = 0;
  double addition = 0;
  late Establishment establishment;
  late TransactionType type;
  late Payment payment;
  late DateTime createdAt;
  List<Item> items = [];

  Transaction.unnamed();

  Transaction({
    required this.id,
    required this.establishment,
    required this.type,
    required this.payment,
    required this.total,
    required this.createdAt,
    required this.items,
    required this.discount,
    required this.addition,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      establishment: Establishment.fromJson(json['establishment']),
      type: TransactionType.fromJson(json['type']),
      payment: Payment.fromJson(json['payment']),
      total: json['total'].toDouble(),
      createdAt: DateTime.parse(json['date']),
      items: (json['items'] as List)
          .map((itemJson) => Item.fromJson(itemJson))
          .toList(),
      discount: json['discount'].toDouble(),
      addition: json['addition'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'establishment': establishment.toJson(),
      'type': TransactionType.toJson(),
      'payment': payment.toJson(),
      'total': total,
      'date': createdAt.toIso8601String(),
      'items': items.map((item) => item.toJson()).toList(),
      "discount": discount,
      "addition": addition,
    };
  }
}
