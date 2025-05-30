import 'package:restaurant_service/data/models/food_model.dart';

class FoodWithQuantityModel {
  int qauntity = 1;
  FoodModel foodModel;

  FoodWithQuantityModel({required this.qauntity, required this.foodModel});

  double totalPrice() {
    return qauntity * foodModel.price;
  }
}
