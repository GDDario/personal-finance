import 'package:personal_finance/domain/models/adjustment.dart';

class Discount extends Adjustment {
  Discount(super.id, super.name);

  @override
  String typeString() {
    return 'Discount';
  }
}
