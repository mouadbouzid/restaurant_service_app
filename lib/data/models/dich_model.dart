import 'package:restaurant_service/data/models/food_model.dart';

class DichModel implements FoodModel {
  @override
  String image;
  @override
  String name;
  @override
  double price;

  DichModel({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  String editPrice(double newPrice) {
    price = newPrice;
    return "The price has been changed";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DichModel && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
