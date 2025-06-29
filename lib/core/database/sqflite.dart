import 'package:restaurant_service/data/models/food_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqflite {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> _intialDb() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'restaurantdb.db');
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  _onCreate(Database db, int version) {
    Batch batch = db.batch();
    batch.execute('''
      CREATE TABLE foods (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      image TEXT NOT NULL,
      name TEXT NOT NULL,
      price REAL NOT NULL,
      category TEXT NOT NULL
      )
    ''');
    batch.commit();
  }

  Future<int> insertFood(FoodModel food) async {
    Database? mydb = await db;
    int response = await mydb!.insert('foods', food.toMap());
    return response;
  }

  Future<List<FoodModel>> getAllFood() async {
    Database? mydb = await db;
    final response = await mydb!.query('foods');
    return response.map((item) => FoodModel.fromMap(item)).toList();
  }

  Future<int> updateFood(FoodModel food) async {
    Database? mydb = await db;
    int response = await mydb!
        .update('foods', food.toMap(), where: 'id = ?', whereArgs: [food.id]);
    return response;
  }

  Future<int> deleteFood(int id) async {
    Database? mydb = await db;
    return await mydb!.delete('foods', where: 'id = ?', whereArgs: [id]);
  }
}
