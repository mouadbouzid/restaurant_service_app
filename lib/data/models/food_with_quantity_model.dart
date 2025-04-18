import 'package:restaurant_service/data/models/food_model.dart';

class FoodWithQuantityModel {
  static int _idCounter = 1;

  final int id;
  int qauntity;
  FoodModel foodModel;
  double totalPrice() {
    return qauntity * foodModel.price;
  }

  FoodWithQuantityModel({required this.qauntity, required this.foodModel})
      : id = _idCounter++;
}
