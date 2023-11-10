import 'package:flutter/material.dart';
import 'package:personal_finance/model/section.dart';
import 'package:personal_finance/sections/main_dashboard_section.dart';
import 'package:personal_finance/sections/new_transaction_section.dart';

final List<Section> sections = [
  Section(
    id: 1,
    name: "Painel principal",
    icon: Icons.dashboard,
    widget: NewTransactionSection(),
  ),
  Section(
    id: 2,
    name: "Transações",
    icon: Icons.money,
    widget: NewTransactionSection(),
  ),
  Section(
    id: 3,
    name: "Registros",
    icon: Icons.description,
    widget: MainDashboard(),
  ),
  Section(
    id: 4,
    name: "Contas",
    icon: Icons.credit_card,
    widget: MainDashboard(),
  ),
  Section(
    id: 5,
    name: "Categorias",
    icon: Icons.category,
    widget: MainDashboard(),
  ),
  Section(
    id: 6,
    name: "Metas",
    icon: Icons.insert_chart,
    widget: MainDashboard(),
  ),
];
