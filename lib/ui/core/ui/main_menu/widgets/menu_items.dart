import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:personal_finance/ui/core/ui/main_menu/view_models/main_menu_viewmodel.dart';
import 'package:personal_finance/routing/routes.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _MenuItem(
          title: 'Dashboard',
          icon: Icons.dashboard,
          route: Routes.dashboard,
        ),
        SizedBox(height: 5),
        _MenuItem(
          title: 'New expense',
          icon: Icons.money,
          route: Routes.newExpense,
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const _MenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final expanded = context.watch<MainMenuViewModel>().expanded;
    final isSelected = GoRouterState.of(context).uri.toString() == route;
    final textColor = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onPrimary;
    final bgColor = isSelected
        ? Theme.of(context).colorScheme.onPrimary
        : Colors.transparent;

    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: DefaultMetrics.roundedBorderRadius,
      ),
      color: bgColor,
      child: InkWell(
        borderRadius: DefaultMetrics.roundedBorderRadius,
        onTap: () => context.go(route),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(icon, color: textColor),
              if (expanded)
                Row(
                  children: [
                    const SizedBox(width: 15.0),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor,
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
