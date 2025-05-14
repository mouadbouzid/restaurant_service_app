import 'package:restaurant_service/data/models/food_model.dart';

class ManageFood {
  ManageFood._privateConstructor(); // private constructor
  static final ManageFood _instance =
      ManageFood._privateConstructor(); // single instance

  factory ManageFood() {
    return _instance;
  }

  final List<FoodModel> allProdacts = [];

  void addFood(FoodModel food) {
    allProdacts.add(food);
  }

  void deleteFood(String name) {
    allProdacts.removeWhere((item) => item.name == name);
  }

  String editPrice(String name, double newPrice) {
    for (var prodact in allProdacts) {
      if (prodact.name == name) {
        prodact.price = newPrice;
        return "Le prix a été changé";
      }
    }
    return "Le nom est introuvable ou incorrect";
  }
}
