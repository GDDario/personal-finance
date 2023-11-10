import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance/model/section.dart';
import 'package:personal_finance/provider/section_provider.dart';
import 'package:provider/provider.dart';

class MainSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  @override
  Widget build(BuildContext context) {
    final SectionProvider provider = Provider.of<SectionProvider>(context);
    final Section section = provider.section;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: section.widget,
      ),
    );
  }
}
