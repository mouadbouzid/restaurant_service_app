import 'package:restaurant_service/core/database/sqflite.dart';
import 'package:restaurant_service/data/models/food_model.dart';

class ManageFood {
  List<FoodModel> allProdacts = [];

  ManageFood._privateConstructor(); // private constructor
  static final ManageFood _instance =
      ManageFood._privateConstructor(); // single instance

  factory ManageFood() {
    return _instance;
  }

  Sqflite sqflite = Sqflite();

  Future<void> loadFoods() async {
    allProdacts = await sqflite.getAllData();
  }

  Future<void> addFood(FoodModel food) async {
    await sqflite.insertData(food);
    await loadFoods();
  }

  Future<void> deleteFood(String name) async {
    var food = allProdacts.firstWhere((element) => element.name == name);
    if (food.id != null) {
      await sqflite.deleteData(food.id!);
      await loadFoods();
    }
  }

  Future<void> editPrice(String name, double newPrice) async {
    var food = allProdacts.firstWhere((element) => element.name == name);
    food.price = newPrice;
    await sqflite.updateData(food);
    await loadFoods();
  }
}
