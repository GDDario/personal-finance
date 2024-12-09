import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finance/routing/routes.dart';
import 'package:personal_finance/ui/core/ui/main_menu.dart';
import 'package:personal_finance/ui/dashboard/widgets/dashboard_screen.dart';

GoRouter router() => GoRouter(
      initialLocation: Routes.dashboard,
      routes: <RouteBase>[
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              // Menu on the left, content on the right
              body: Row(
                children: [
                  const MainMenu(),
                  Expanded(child: child),
                ],
              ),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: Routes.dashboard,
              builder: (context, state) {
                return const DashboardScreen();
              },
            ),
          ],
        ),
      ],
    );
