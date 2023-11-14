import 'package:personal_finance/database/dao/base_dao.dart';
import 'package:personal_finance/database/database_service.dart';
import 'package:personal_finance/model/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductDAO extends BaseDAO {
  @override
  Future<int> count() async {
    final database = await DatabaseService().database;
    final int count = Sqflite.firstIntValue(
            await database.rawQuery('SELECT COUNT(*) FROM product')) ??
        0;
    return count;
  }

  @override
  Future<bool> create(String name, int type) async {
    throw UnimplementedError();
    // final database = await DatabaseService().database;
    // final int isCreated = await database.rawInsert(
    //     'INSERT INTO product (name, type) values (?, ?)', [name, type]);
    // return isCreated != 0;
  }

  @override
  Future<bool> deleteById(int id) async {
    final database = await DatabaseService().database;
    final int isDeleted =
        await database.rawDelete('DELETE FROM product WHERE id = ?', [id]);
    return isDeleted != 0;
  }

  @override
  Future<List<Product>> getAll() async {
    final database = await DatabaseService().database;
    final List<Map<String, dynamic>> data = await database.rawQuery('''
        SELECT 
          product.id,
          product.name,
          product.created_at,
          product_category.id as product_category_id,
          product_category.name as product_category_name,
          product_category.created_at as product_category_created_at
        FROM product
        JOIN product_category ON (product_category.id = product.category_id)''');
    final List<Product> products =
        data.map((e) => Product.fromDatabase(e)).toList();
    return products;
  }

  @override
  Future<List> getByFilters(List<Map<String, dynamic>> filters) {
    // TODO: implement getByFilters
    throw UnimplementedError();
  }

  @override
  Future getById() {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<bool> update(t) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
