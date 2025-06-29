import 'package:restaurant_service/core/database/sqflite.dart';
import 'package:restaurant_service/data/models/food_model.dart';

class ManageFood {
  List<FoodModel> allProducts = [];

  //i don't want eveytime create a new class, just one class manage the App.
  ManageFood._privateConstructor();
  static final ManageFood _instance = ManageFood._privateConstructor();

  factory ManageFood() {
    return _instance;
  }

  Sqflite sqflite = Sqflite();

  Future<void> loadFoods() async {
    try {
      allProducts = await sqflite.getAllFood();
    } catch (e) {
      print('Error loading food: $e');
    }
  }

  Future<int> addFood(FoodModel food) async {
    try {
      int response = await sqflite.insertFood(food);
      if (response != 0) {
        await loadFoods();
      }
      return response;
    } catch (e) {
      return 0;
    }
  }

  Future<int> deleteFood(String name) async {
    try {
      // Find the food item
      FoodModel food = allProducts.firstWhere(
        (element) => element.name == name,
        orElse: () => throw Exception('Food with name "$name" not found'),
      );

      if (food.id != null) {
        int response = await sqflite.deleteFood(food.id!);
        if (response != 0) {
          // Only reload if deletion succeeded
          await loadFoods();
        }
        return response;
      }
      return 0; // No ID available
    } catch (e) {
      return 0; // Or consider throwing the exception
    }
  }

  Future<int> editPrice(String name, double newPrice) async {
    try {
      FoodModel food = allProducts.firstWhere(
        (element) => element.name == name,
        orElse: () => throw Exception('Food with name "$name" not found'),
      );

      food.price = newPrice;
      int response = await sqflite.updateFood(food);
      if (response != 0) {
        await loadFoods();
        return response;
      }
      return 0;
    } catch (e) {
      return 0;
    }
  }
}
