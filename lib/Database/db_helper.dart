import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do/Model/model.dart';

class DBHelper {
  // Singleton Pattern------------------------------------
  static final DBHelper instance = DBHelper._internal();
  factory DBHelper() => instance;
  DBHelper._internal();

  static Database? _database;

  static const String TABLE = "todos";

  // Get Database----------------------------------------
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  // Init DB -------------------------------------------
  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), "todo.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  // Create Table ---------------------------------------
  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $TABLE(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        category TEXT,
        date TEXT,
        time TEXT,
        notes TEXT,
        isCompleted INTEGER
      )
    ''');
  }

  // Insert Task ----------------------------------------
  Future<int> insertTask(TaskModel task) async {
    final db = await database;
    return await db.insert(TABLE, task.toMap());
  }

  // Get all tasks -------------------------------------
  Future<List<TaskModel>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(TABLE, orderBy: "id DESC");

    return List.generate(maps.length, (i) {
      return TaskModel.fromMap(maps[i]);
    });
  }

  // Update task --------------------------------------
  Future<int> updateTask(TaskModel task) async {
    final db = await database;
    return await db.update(
      TABLE,
      task.toMap(),
      where: "id = ?",
      whereArgs: [task.id],
    );
  }

  // Delete task -------------------------------------
  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete(
      TABLE,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
