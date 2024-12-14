import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finance/routing/routes.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedRoute = GoRouterState.of(context).uri.toString();

    return Column(
      children: <Widget>[
        _MenuItem(
          title: 'Dashboard',
          icon: Icons.dashboard,
          route: Routes.dashboard,
          selected: selectedRoute == Routes.dashboard,
        ),
        const SizedBox(height: 8),
        _MenuItem(
          title: 'Expenses',
          icon: Icons.money,
          route: Routes.expenses,
          selected: selectedRoute == Routes.expenses,
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final bool selected;

  const _MenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    var textColor = selected ? Colors.blue : Colors.white;
    var bgColor = selected ? Colors.white : Colors.transparent;

    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      color: bgColor,
      child: ListTile(
        onTap: () => context.go(route),
        textColor: textColor,
        iconColor: textColor,
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
