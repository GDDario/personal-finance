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
}
