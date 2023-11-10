import 'package:personal_finance/model/payment_subtype.dart';

class Payment {
  int id;
  String name;
  DateTime createdAt;
  List<PaymentSubtype>? paymentSubtypes;

  Payment({required this.id, required this.name, required this.createdAt, this.paymentSubtypes});

  factory Payment.fromJson(Map<String, dynamic> json) {
    List<dynamic>? paymentSubtypeList = json['paymentSubtypes'];
    List<PaymentSubtype>? subtypes = paymentSubtypeList != null
        ? paymentSubtypeList
        .map((subtype) => PaymentSubtype.fromJson(subtype))
        .toList()
        : null;

    return Payment(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      paymentSubtypes: subtypes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'paymentSubtypes': paymentSubtypes?.map((subtype) => subtype.toJson()).toList(),
    };
  }
}