import 'package:personal_finance/mock/mocked_products.dart';
import 'package:personal_finance/model/item.dart';

List<Item> mockedItems = [
  Item(id: 1, product: mockedProducts[0], price: 1, quantity: 1, total: 2),
  Item(id: 2, product: mockedProducts[1], price: 3.4, quantity: 2, total: 6.8),
  Item(id: 3, product: mockedProducts[2], price: 7.32, quantity: 10, total: 73.2),
  Item(id: 4, product: mockedProducts[3], price: 1.23, quantity: 5, total: 6.15),
  Item(id: 5, product: mockedProducts[4], price: 8.90, quantity: 3, total: 26.7),
  Item(id: 6, product: mockedProducts[5], price: 1.25, quantity: 12, total: 15),
  Item(id: 7, product: mockedProducts[6], price: 5.00, quantity: 1, total: 5),
  Item(id: 8, product: mockedProducts[7], price: 8.00, quantity: 6, total: 48),
];