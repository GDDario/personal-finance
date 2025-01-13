import 'package:personal_finance/domain/models/addition.dart';
import 'package:personal_finance/domain/models/attachment.dart';
import 'package:personal_finance/domain/models/discount.dart';
import 'package:personal_finance/domain/models/establishment.dart';
import 'package:personal_finance/domain/models/expense.dart';
import 'package:personal_finance/domain/models/payment_method.dart';
import 'package:personal_finance/domain/models/product.dart';
import 'package:personal_finance/domain/models/product_category.dart';

List<Expense> expensesMock = [
  Expense(
    1,
    110,
    100,
    20,
    10,
    Establishment(
      1,
      'Local Market',
      'Nice good local market',
    ),
    [
      Product(1, 'Bread', ProductCategory.simple(1, 'Food'), DateTime.now(),
          null, 2),
      Product(2, 'Gingerbread', ProductCategory.simple(1, 'Food'),
          DateTime.now(), null, 3.2),
      Product(3, 'Little buns', ProductCategory.simple(1, 'Food'),
          DateTime.now(), null, 1.5),
    ],
    [PaymentMethod(1, 'Credit card', DateTime.now(), null)],
    [
      Addition.withValue(1, 'Coupon/promo code', 20),
      Discount.withValue(2, 'Shipping', 10)
    ],
    [
      Attachment('proof-of-payment.pdf', '../proof-of-payment.pdf', 30000,
          DateTime.now())
    ],
    DateTime.now().subtract(
      const Duration(minutes: 2),
    ),
  ),
  Expense(
    2,
    250,
    230,
    20,
    15,
    Establishment(
      2,
      'Electronics Store',
      'Store specializing in gadgets',
    ),
    [
      Product(4, 'Headphones', ProductCategory.simple(2, 'Electronics'),
          DateTime.now(), null, 150),
      Product(5, 'USB Cable', ProductCategory.simple(2, 'Electronics'),
          DateTime.now(), null, 20),
      Product(6, 'Charger', ProductCategory.simple(2, 'Electronics'),
          DateTime.now(), null, 60),
    ],
    [PaymentMethod(2, 'Debit card', DateTime.now(), null)],
    [
      Addition.withValue(3, 'Gift wrap', 10),
      Discount.withValue(4, 'Promo discount', 5)
    ],
    [
      Attachment('receipt.png', '../receipt.png', 50000, DateTime.now())
    ],
    DateTime.now().subtract(
      const Duration(hours: 3),
    ),
  ),
  Expense(
    3,
    500,
    480,
    30,
    20,
    Establishment(
      3,
      'Online Store',
      'Wide variety of products',
    ),
    [
      Product(7, 'Book', ProductCategory.simple(3, 'Books'), DateTime.now(),
          null, 40),
      Product(8, 'Notebook', ProductCategory.simple(3, 'Stationery'),
          DateTime.now(), null, 10),
      Product(9, 'Desk Lamp', ProductCategory.simple(2, 'Electronics'),
          DateTime.now(), null, 60),
    ],
    [PaymentMethod(3, 'PayPal', DateTime.now(), null)],
    [
      Addition.withValue(5, 'Insurance', 30),
      Discount.withValue(6, 'Promo Code', 20)
    ],
    [
      Attachment('invoice.pdf', '../invoice.pdf', 60000, DateTime.now())
    ],
    DateTime.now().subtract(
      const Duration(days: 1),
    ),
  ),
  Expense(
    4,
    75,
    70,
    5,
    0,
    Establishment(
      4,
      'Coffee Shop',
      'Cozy cafe with great coffee',
    ),
    [
      Product(10, 'Espresso', ProductCategory.simple(1, 'Food & Drinks'),
          DateTime.now(), null, 3),
      Product(11, 'Croissant', ProductCategory.simple(1, 'Food & Drinks'),
          DateTime.now(), null, 2.5),
      Product(12, 'Latte', ProductCategory.simple(1, 'Food & Drinks'),
          DateTime.now(), null, 4.5),
    ],
    [PaymentMethod(4, 'Cash', DateTime.now(), null)],
    [
      Addition.withValue(7, 'Extra syrup', 5),
    ],
    [
      Attachment('bill.jpg', '../bill.jpg', 15000, DateTime.now())
    ],
    DateTime.now().subtract(
      const Duration(hours: 6),
    ),
  ),
  Expense(
    5,
    300,
    280,
    40,
    20,
    Establishment(
      5,
      'Gym Membership',
      'Monthly subscription fee',
    ),
    [
      Product(13, 'Membership Fee', ProductCategory.simple(4, 'Health & Fitness'),
          DateTime.now(), null, 280),
    ],
    [PaymentMethod(5, 'Credit card', DateTime.now(), null)],
    [
      Addition.withValue(8, 'Trainer session', 20),
      Discount.withValue(9, 'Referral discount', 10)
    ],
    [
      Attachment('contract.pdf', '../contract.pdf', 70000, DateTime.now())
    ],
    DateTime.now().subtract(
      const Duration(days: 2),
    ),
  ),
  Expense(
    6,
    400,
    380,
    50,
    30,
    Establishment(
      6,
      'Furniture Store',
      'Affordable and stylish furniture',
    ),
    [
      Product(14, 'Chair', ProductCategory.simple(5, 'Furniture'),
          DateTime.now(), null, 100),
      Product(15, 'Table', ProductCategory.simple(5, 'Furniture'),
          DateTime.now(), null, 200),
      Product(16, 'Shelf', ProductCategory.simple(5, 'Furniture'),
          DateTime.now(), null, 80),
    ],
    [PaymentMethod(6, 'Bank transfer', DateTime.now(), null)],
    [
      Addition.withValue(10, 'Delivery', 50),
      Discount.withValue(11, 'Seasonal sale', 30)
    ],
    [
      Attachment('order-summary.pdf', '../order-summary.pdf', 80000,
          DateTime.now())
    ],
    DateTime.now().subtract(
      const Duration(days: 3),
    ),
  ),
];
