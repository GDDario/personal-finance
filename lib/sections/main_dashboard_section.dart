import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Painel principal",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 32.0,
          ),
          Text("O campo aqui é..."),
        ],
      ),
    );
  }
}
