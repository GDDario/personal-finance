import 'package:personal_finance/domain/models/payment_method.dart';

final List<PaymentMethod> paymentMethodsMock = [
  PaymentMethod.simple(1, 'Cash'),
  PaymentMethod.simple(2, 'Credit card'),
  PaymentMethod.simple(3, 'Debit card'),
  PaymentMethod.simple(4, 'Prepaid card'),
  PaymentMethod.simple(5, 'PayPal')
];
