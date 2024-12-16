import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finance/routing/routes.dart';
import 'package:personal_finance/ui/core/ui/main_menu/view_models/main_menu_viewmodel.dart';
import 'package:personal_finance/ui/core/ui/main_menu/widgets/main_menu.dart';
import 'package:personal_finance/ui/dashboard/widgets/dashboard_screen.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:personal_finance/ui/new_expense/widgets/new_expense_screen.dart';
import 'package:provider/provider.dart';

GoRouter router() => GoRouter(
      initialLocation: Routes.newExpense,
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return ChangeNotifierProvider(
              create: (_) => MainMenuViewModel(),
              child: Scaffold(
                body: Row(
                  children: [
                    const MainMenu(),
                    Expanded(child: child),
                  ],
                ),
              ),
            );
          },
          routes: [
            GoRoute(
              path: Routes.dashboard,
              pageBuilder: (context, state) => buildPageWithAnimation(
                state: state,
                child: const DashboardScreen(),
              ),
            ),
            GoRoute(
              path: Routes.newExpense,
              pageBuilder: (context, state) => buildPageWithAnimation(
                state: state,
                child: NewExpenseScreen(
                  viewModel: NewExpenseViewModel()
                ),
              ),
            ),
          ],
        ),
      ],
    );

CustomTransitionPage<T> buildPageWithAnimation<T>({
  required Widget child,
  required GoRouterState state,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
