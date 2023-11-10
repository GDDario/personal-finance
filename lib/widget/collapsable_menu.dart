import 'package:flutter/material.dart';
import 'package:personal_finance/mock/mocked_sections.dart';
import 'package:personal_finance/mock/mocked_users.dart';
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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isCollapsed ? 72 : 250,
          child: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CollapseIcon(buildContext, isCollapsed),
              Container(
                height: MediaQuery.of(buildContext).size.height - 36,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color(0xFF3F51B5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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

  Widget CollapseIcon(BuildContext context, bool isCollapsed) {
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final border = BorderSide(color: Color(0xFF3F51B5));

    return InkWell(
      child: Container(
        padding: EdgeInsets.only(
          left: isCollapsed ? 0.0 : 10.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xffFAFAFA),
          border: Border(
            right: border,
            bottom: border,
          ),
        ),
        width: 36.0,
        height: 36.0,
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      onTap: () {
        final provider = Provider.of<MenuProvider>(context, listen: false);
        provider.toggleIsCollapsed();
      },
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
