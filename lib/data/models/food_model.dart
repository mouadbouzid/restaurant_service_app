import 'package:restaurant_service/data/models/food_category_enum.dart';

class FoodModel {
  String name;
  String image;
  double price;
  FoodCategory foodCategory;

  FoodModel(this.image, this.name, this.price, this.foodCategory);

  String editPrice(double newPrice) {
    price = newPrice;
    return "The price has been changed";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FoodModel && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
