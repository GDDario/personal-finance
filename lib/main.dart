import 'dart:io';

import 'package:flutter/material.dart';
import 'package:personal_finance/database/database_service.dart';
import 'package:personal_finance/provider/menu_provider.dart';
import 'package:personal_finance/provider/section_provider.dart';
import 'package:personal_finance/widget/collapsable_menu.dart';
import 'package:personal_finance/widget/main_section.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
  }

  // Change the default factory. On iOS/Android, if not using `sqlite_flutter_lib` you can forget
  // this step, it will use the sqlite version available on the system.
  databaseFactory = databaseFactoryFfi;
  final database = DatabaseService().database;

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
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF3F51B5),
            secondary: Colors.amber,
          ),
          fontFamily: "Inter",
          textTheme: ThemeData.light().textTheme.copyWith(
                headlineLarge: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
                headlineMedium: const TextStyle(
                  fontSize: 18.0,
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
        color: const Color(0xFFFAFAFA),
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
