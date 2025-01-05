import 'package:personal_finance/domain/models/adjustment.dart';

class Addition extends Adjustment {
  Addition(super.id, super.name);

  Addition.withValue(super.id, super.name, super.value) : super.withValue();

  @override
  String typeString() {
    return 'Addition';
  }
}
