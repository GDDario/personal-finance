import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finance/routing/routes.dart';
import 'package:personal_finance/ui/dashboard/widgets/dashboard_screen.dart';

GoRouter router() => GoRouter(
      initialLocation: Routes.dashboard,
      routes: <RouteBase>[
        ShellRoute(
          builder: (context, state, child) {
            return BottomNavigationBar(
              backgroundColor: Colors.indigoAccent,
                items: [
              BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Abc'),
              BottomNavigationBarItem(icon: Icon(Icons.zoom_in), label: 'Zoom in'),
            ]);
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
