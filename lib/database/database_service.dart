import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const String name = "finances.db";
    if (Platform.isAndroid || Platform.isIOS) {
      final String path = await getDatabasesPath();
      return join(path, name);
    }
    return join(current + "/lib/database", name);
  }

  Future<Database> _initialize() async {
    final String path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await createTables(database);

  Future<void> createTables(Database database) async {
    await database.execute("""
    -- Predefined
    CREATE TABLE IF NOT EXISTS user_type(
      id INTEGER PRIMARY KEY,
      name VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS user(
      id INTEGER PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      user_type INTEGER NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (user_type) REFERENCES user_type(id)
    );
    
    -- Predefined
    CREATE TABLE IF NOT EXISTS establishment_type(
      id INTEGER PRIMARY KEY,
      name VARCHAR(100)
    );
    
    CREATE TABLE IF NOT EXISTS establishment(
      id INTEGER PRIMARY KEY NOT NULL,
      name VARCHAR(100) NOT NULL,
      type INTEGER NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (type) REFERENCES establishment_type(id)
    );
    
    CREATE TABLE IF NOT EXISTS payment_subtype(
      id INTEGER PRIMARY KEY NOT NULL,
      name VARCHAR(100) NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      edited_at DATETIME
    );
    
    CREATE TABLE IF NOT EXISTS payment(
      id INTEGER PRIMARY KEY NOT NULL,
      name VARCHAR(100) NOT NULL,
      subtype INTEGER NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (subtype) REFERENCES payment_subtype(id)
    );
    
    CREATE TABLE transaction_data(
      id INTEGER PRIMARY KEY,
      total FLOAT DEFAULT 0,
      discount FLOAT DEFAULT 0,
      addition FLOAT DEFAULT 0,
      type INTEGER NOT NULL,
      establishment_id INTEGER NOT NULL,
      payment_id INTEGER NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );
    
    CREATE TABLE IF NOT EXISTS product_category(
      id INTEGER PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      created_at DATETIME NOT NULL,
      updated_at DATETIME
    );
    
    CREATE TABLE IF NOT EXISTS product(
      id INTEGER PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      category_id INTEGER NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME,
      FOREIGN KEY (category_id) REFERENCES product_category(id)
    );
    
    CREATE TABLE IF NOT EXISTS item(
      id INTEGER PRIMARY KEY,
      product_id INTEGER NOT NULL,
      price FLOAT DEFAULT 0,
      quantity INTEGER DEFAULT 1,
      total float DEFAULT 0
    );
    """);
  }
}
