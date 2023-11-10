import 'package:personal_finance/model/payment_subtype.dart';
import 'package:personal_finance/model/payment.dart';

List<Payment> mockedPayments = [
  Payment(
    id: 1,
    name: "Cartão",
    createdAt: DateTime.now(),
    paymentSubtypes: [
      PaymentSubtype(
        id: 1,
        name: "Cartão Elo",
        createdAt: DateTime.now(),
      ),
    ],
  ),
  Payment(
    id: 2,
    name: "Dinheiro",
    createdAt: DateTime.now(),
  ),
  Payment(
    id: 3,
    name: "Cheque",
    createdAt: DateTime.now(),
  ),
];
