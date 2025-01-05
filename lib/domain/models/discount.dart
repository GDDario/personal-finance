import 'package:personal_finance/domain/models/adjustment.dart';

class Discount extends Adjustment {
  Discount(super.id, super.name);

  Discount.withValue(super.id, super.name, super.value) : super.withValue();

  @override
  String typeString() {
    return 'Discount';
  }
}
