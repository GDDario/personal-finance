import 'package:flutter/material.dart';
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
      color: Colors.blue,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: viewModel.expanded ? 250 : 85,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: viewModel.toggleExpanded,
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: imageAsset()),
                  ],
                ),
                SizedBox(height: 40),
                Expanded(child: MenuItems()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
