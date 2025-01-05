import 'package:personal_finance/domain/models/adjustment.dart';
import 'package:personal_finance/domain/models/attachment.dart';
import 'package:personal_finance/domain/models/establishment.dart';
import 'package:personal_finance/domain/models/generic_item.dart';
import 'package:personal_finance/domain/models/payment_method.dart';

class Expense {
  late double total;
  late double totalItems;
  late double totalAdditions;
  late double totalDiscounts;
  late Establishment establishment;
  late List<GenericItem> items;
  late List<PaymentMethod> paymentMethods;
  late List<Adjustment> adjustments;
  late List<Attachment> attachments;
  late DateTime dateTime;

  Expense(this.total, this.totalItems, this.totalAdditions, this.totalDiscounts,
      this.establishment, this.items, this.paymentMethods, this.adjustments,
      this.attachments, this.dateTime);
}
