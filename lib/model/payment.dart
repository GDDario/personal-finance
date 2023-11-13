import 'package:personal_finance/model/payment_subtype.dart';

class Payment {
  int id;
  String name;
  DateTime createdAt;
  List<PaymentSubtype>? paymentSubtypes;

  Payment(
      {required this.id,
      required this.name,
      required this.createdAt,
      this.paymentSubtypes});
}
