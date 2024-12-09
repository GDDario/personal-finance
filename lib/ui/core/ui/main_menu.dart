import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  final Duration duration = const Duration(milliseconds: 200);
  final Curve curve = Curves.linear;

  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = true;

  void _toggleSize() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 250, maxWidth: 300),
        child: AnimatedSize(
          duration: widget.duration,
          curve: widget.curve,
          reverseDuration: widget.duration,
          child: SizedBox(
            width: _isExpanded ? 300 : 250,
            child: Column(
              children: <Widget>[
                Text('Main menu'),
                IconButton(
                  onPressed: () => _toggleSize(),
                  icon: Icon(Icons.toggle_off_outlined),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
