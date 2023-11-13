abstract class BaseDAO<T> {
  Future<T> getById();
  Future<List<T>> getAll();
  Future<List<T>> getByFilters(List<Map<String, dynamic>> filters);

  Future<int> count();

  Future<bool> create(String name, int type);

  Future<bool> update(T t);

  Future<bool> deleteById(int id);
}
