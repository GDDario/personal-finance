import 'package:flutter/material.dart';

class Section {
  final int id;
  final String name;
  final IconData icon;
  final Widget widget;

  Section({required this.id, required this.name, required this.icon, required this.widget});
}