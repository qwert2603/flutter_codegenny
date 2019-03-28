import 'package:data_class/data_class.dart';
import 'package:sqflite/sqflite.dart';

@Entity()
class Person {
  @PrimaryKey()
  int id;
  String name;
  double age;
  bool isMale;

  Person();

  Person.d(this.id, this.name, this.age, this.isMale);

  @override
  String toString() {
    return 'Person{id: $id, name: $name, age: $age, isMale: $isMale}';
  }
}

@Dao()
abstract class PersonDao {
  @Insert()
  Future<int> insertPersons(List<Person> persons);

  @Delete()
  Future<int> deletePersons(List<int> ids);

  @Query("SELECT * FROM Person WHERE id IN (:ids)")
  Future<Iterable<Person>> getPersons(List<int> ids);
}

class PersonDaoImpl implements PersonDao {
  static const SQL_CREATE =
      "CREATE TABLE Person (id INTEGER PRIMARY KEY, name TEXT, age REAL, isMale INT)";

  final Database db;

  PersonDaoImpl(this.db);

  @override
  Future<int> insertPersons(List<Person> persons) {
    final sql = StringBuffer();
    sql.write("INSERT OR REPLACE INTO Person (id, name, age, isMale) VALUES");
    sql.write(List.filled(persons.length, "(?, ?, ?, ?)").join(","));
    print(sql.toString());
    return db.rawInsert(
      sql.toString(),
      persons
          .map((p) => [p.id, p.name, p.age, p.isMale ? 1 : 0])
          .expand((l) => l)
          .toList(),
    );
  }

  @override
  Future<Iterable<Person>> getPersons(List<int> ids) async {
    final List<Map<String, dynamic>> queried = await db.rawQuery(
      "SELECT * FROM Person WHERE id IN(${List.filled(ids.length, "?").join(",")})",
      ids,
    );
    return queried.map((m) => Person()
      ..id = m['id']
      ..name = m['name']
      ..age = m['age']
      ..isMale = m['isMale'] != 0);
  }

  @override
  Future<int> deletePersons(List<int> ids) async {
    final sql = StringBuffer();
    sql.write("DELETE FROM Person WHERE id in (");
    sql.write(List.filled(ids.length, "?").join(","));
    sql.write(")");
    print(sql.toString());
    return await db.rawDelete(sql.toString(), ids);
  }
}
