
import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/sorulabilecek/sorulabilecek.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();
  String tblTodo = "todo";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;
  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "todos.db";
    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tblTodo($colId INTEGER PRIMARY KEY, $colTitle TEXT," +
            "$colDescription TEXT, $colPriority INTEGER, $colDate TEXT" +
            ")");
  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.insert(tblTodo, todo.toMap());
    return result;
  }

  Future<List> getTodos() async {
    List<Todo> todoList = List<Todo>();
    Database db = await this.db;
    var result =
    await db.rawQuery("SELECT * FROM $tblTodo ORDER BY $colPriority ASC");
    result.forEach((element) {
      todoList.add(Todo.fromObject(element));
    });
    return todoList;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $tblTodo"));

    return result;
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.update(tblTodo, todo.toMap(),
        where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }


  Future<int> deleteTodo(int id) async {
    Database db = await this.db;
    var result = await db.delete(tblTodo,  where: "$colId = ?", whereArgs: [id]);
    return result;
  }
}