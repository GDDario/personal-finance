import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personal_finance/ui/core/ui/main_menu/view_models/main_menu_viewmodel.dart';
import 'package:personal_finance/ui/core/ui/main_menu/widgets/menu_items.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainMenuViewModel>();

    return Container(
      color: Colors.blue,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: viewModel.expanded ? 300 : 250,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/img/personal-finance-high-resolution-logo-transparent.png',
                  width: 150,
                ),
                const Text('Main menu'),
                IconButton(
                  onPressed: viewModel.toggleExpanded,
                  icon: Icon(viewModel.expanded
                      ? Icons.toggle_on_outlined
                      : Icons.toggle_off_outlined),
                ),
                MenuItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
