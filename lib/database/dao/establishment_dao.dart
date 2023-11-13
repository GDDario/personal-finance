import 'package:personal_finance/database/dao/base_dao.dart';
import 'package:personal_finance/database/database_service.dart';
import 'package:personal_finance/model/establishment.dart';
import 'package:sqflite/sqflite.dart';

class EstablishmentDAO extends BaseDAO {
  @override
  Future<int> count() async {
    final database = await DatabaseService().database;
    final int count = Sqflite.firstIntValue(
            await database.rawQuery('SELECT COUNT(*) FROM table_name')) ??
        0;
    return count;
  }

  @override
  Future<bool> create(String name, int type) async {
    final database = await DatabaseService().database;
    final int isCreated = await database.rawInsert(
        'INSERT INTO establishment (name, type) values (?, ?)', [name, type]);
    return isCreated != 0;
  }

  @override
  Future<bool> deleteById(int id) async {
    final database = await DatabaseService().database;
    final int isDeleted = await database
        .rawDelete('DELETE FROM establishment WHERE id = ?', [id]);
    return isDeleted != 0;
  }

  @override
  Future<List<Establishment>> getAll() async {
    final database = await DatabaseService().database;
    final List<Map<String, dynamic>> data = await database.rawQuery('''
        SELECT 
          establishment_type.id,
          establishment.name, 
          establishment.created_at,
          establishment_type.id as establishment_type_id,
          establishment_type.name as establishment_type_name
        FROM establishment
        JOIN establishment_type ON (establishment_type.id = establishment.type)''');
    final List<Establishment> establishments =
        data.map((e) => Establishment.fromDatabase(e)).toList();
    return establishments;
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
