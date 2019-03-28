import 'package:flutter/material.dart';
import 'package:flutter_codegenny/sdg.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  Database database = await openDatabase("test.db", version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE Person (id INTEGER PRIMARY KEY, name TEXT, age REAL, isMale INT)');
  });

  PersonDaoImpl dao = PersonDaoImpl(database);
  await dao.insertPersons([
    Person.d(1, "alex", 24, true),
    Person.d(2, "sss", 22, false),
    Person.d(3, "qqq", 53, true),
  ]);
  print(await dao.getPersons([1]));
  print(await dao.getPersons([2]));
  print(await dao.getPersons([3]));
  print(await dao.getPersons([1, 2, 3]));
  print(await dao.deletePersons([3]));
  print(await dao.getPersons([3]));
  print(await dao.getPersons([1, 2, 3]));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'codegenny',
            ),
          ],
        ),
      ),
    );
  }
}
