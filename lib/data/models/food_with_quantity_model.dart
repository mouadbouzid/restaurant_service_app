import 'package:restaurant_service/data/models/food_model.dart';

class FoodWithQuantityModel {
  static int _idCounter = 1;

  final int id;
  int qauntity = 1;
  FoodModel foodModel;

  FoodWithQuantityModel({required this.qauntity, required this.foodModel})
      : id = _idCounter++;

  double totalPrice() {
    return qauntity * foodModel.price;
  }
}
