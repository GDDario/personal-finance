import 'package:flutter/material.dart';
import 'package:personal_finance/ui/core/themes/default_metrics.dart';
import 'package:provider/provider.dart';
import 'package:personal_finance/ui/core/ui/main_menu/view_models/main_menu_viewmodel.dart';
import 'package:personal_finance/ui/core/ui/main_menu/widgets/menu_items.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainMenuViewModel>();

    Widget imageAsset() {
      return viewModel.expanded
          ? Image.asset(
              'assets/img/personal-finance-full-logo-transparent.png',
              width: 140,
              height: 45,
              alignment: AlignmentDirectional.centerStart,
            )
          : Image.asset(
              'assets/img/personal-finance-icon-transparent-logo.png',
              width: 140,
              height: 45,
              alignment: AlignmentDirectional.centerStart,
            );
    }

    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: viewModel.expanded ? 250 : 85,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: viewModel.toggleExpanded,
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: imageAsset()),
                  ],
                ),
                const SizedBox(height: 40),
                const Expanded(child: MenuItems()),
                const Spacer(),
                SettingsButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expanded = context.watch<MainMenuViewModel>().expanded;
    final isSelected = false;
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
        onTap: () => () {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(Icons.settings, color: textColor),
              if (expanded)
                Row(
                  children: [
                    const SizedBox(width: 15.0),
                    Text(
                      'Settings',
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
