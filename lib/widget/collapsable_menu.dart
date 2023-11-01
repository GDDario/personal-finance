import 'package:flutter/material.dart';
import 'package:personal_finance/data/sections.dart';
import 'package:personal_finance/data/users.dart';
import 'package:personal_finance/model/section.dart';
import 'package:personal_finance/provider/section_provider.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../provider/menu_provider.dart';

class CollapsableMenu extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 8);

  final User user = naturalUser;

  @override
  Widget build(BuildContext buildContext) {
    final MenuProvider provider = Provider.of<MenuProvider>(buildContext);
    final bool isCollapsed = provider.isCollapsed;

    return Container(
      width: isCollapsed ? 72 : 250,
      child: Drawer(
        child: Container(
          color: Color(0xFFFAFAFA),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(18),
                width: double.infinity,
                child: _buildHeader(isCollapsed),
              ),
              const SizedBox(height: 24),
              buildList(
                  buildContext: buildContext,
                  items: sections,
                  isCollapsed: isCollapsed),
              const SizedBox(height: 24),
              Divider(color: Colors.white70),
              Spacer(),
              buildCollapseIcon(buildContext, isCollapsed),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList({
    required BuildContext buildContext,
    required bool isCollapsed,
    required List<Section> items,
    int indexOffset = 0,
  }) =>
      ListView.builder(
        padding: isCollapsed ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.name,
            icon: item.icon,
            onClicked: () => changeSection(buildContext, item),
          );
        },
      );

  void changeSection(BuildContext context, Section section) {
    final provider = Provider.of<SectionProvider>(context, listen: false);
    provider.changeSection(section);
  }

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final leading = Icon(icon, color: Color(0xFF3F51B5));

    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Transform(
                transform: Matrix4.translationValues(-16, 0.0, 0.0),
                child: Text(
                  text,
                  style: TextStyle(color: color, fontSize: 16),
                ),
              ),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : EdgeInsets.only(right: 16);
    final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: width,
            height: size,
            child: Icon(icon, color: Colors.black),
          ),
          onTap: () {
            final provider = Provider.of<MenuProvider>(context, listen: false);
            provider.toggleIsCollapsed();
          },
        ),
      ),
    );
  }

  Widget _buildHeader(bool isCollapsed) {
    Image image = Image.asset(
      "assets/images/default-user.png",
      width: 36.0,
      height: 36.0,
    );

    return isCollapsed
        ? image
        : Row(
            children: [
              image,
              SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(
                    height: 1.0,
                  ),
                  Text(
                    user.userType.name,
                  ),
                ],
              )
            ],
          );
  }
}
