import 'package:restaurant_service/data/models/food_model.dart';

class ManageFood {
  final List<FoodModel> allProdacts = [];

  void addFood(FoodModel food) {
    allProdacts.add(food);
  }

  void deleteFood(String name) {
    allProdacts.removeWhere((item) => item.name == name);
  }

  String editPrice(String name, double newPrice) {
    String msg = '';
    for (var prodact in allProdacts) {
      if (prodact.name == name) {
        prodact.price = newPrice;
        msg = "Le prix a été changé";
      } else {
        msg = "Le nom est introuvale ou incorrect";
      }
    }
    return msg;
  }
}
