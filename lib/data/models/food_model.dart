import 'package:restaurant_service/data/models/enum/food_category_enum.dart';

class FoodModel {
  final int? id;
  String name;
  String image;
  double price;
  FoodCategory foodCategory;

  FoodModel({
    this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.foodCategory,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'category': foodCategory.name,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: map['id'] as int?,
      image: map['image'] as String,
      name: map['name'] as String,
      price: (map['price'] as num).toDouble(),
      foodCategory: FoodCategory.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => FoodCategory.breakfast,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FoodModel && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
