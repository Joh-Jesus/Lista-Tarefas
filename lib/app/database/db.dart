import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  DB._();
  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'lista_tarefas.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_lista);
    await db.execute(_tarefa);
    db.insert('lista', {'total': 0});
  }

  String get _tarefa => '''
    CREATE TABLE tarefa (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      data_de_criacao INT,
      descricao TEXT
    );
''';

  String get _lista => '''
    CREATE TABLE tarefa (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      data_de_criacao INT,
      total INTEGER
    );
''';
}
