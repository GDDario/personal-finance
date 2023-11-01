import 'package:flutter/cupertino.dart';

import '../widget/section_title.dart';

class Transactions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Trasactions();

}

class _Trasactions extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SectionTitle("Transações")
        ],
      ),
    );
  }
}