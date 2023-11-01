import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_finance/provider/menu_provider.dart';
import 'package:personal_finance/provider/section_provider.dart';
import 'package:personal_finance/widget/collapsable_menu.dart';
import 'package:personal_finance/widget/main_section.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SectionProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return MenuProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Inter",
          textTheme: ThemeData.light().textTheme.copyWith(
                headlineMedium: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
        ),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.black,
        color: Color(0xFFFAFAFA),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CollapsableMenu(),
            MainSection(),
          ],
        ),
      ),
    );
  }
}
