import 'package:restaurant_service/data/models/food_with_quantity_model.dart';

class OrderModel {
  List<FoodWithQuantityModel> allOrders = [];
  double totalPrice = 0;

  void addFood(FoodWithQuantityModel foodWithQuantityModel) {
    allOrders.add(foodWithQuantityModel);
  }

  void deleteFood(int namber) {
    allOrders.removeWhere((item) => item.id == namber);
  }

  void deleteAllFood() {
    allOrders.clear();
  }

  void ordersPrice() {
    for (var order in allOrders) {
      totalPrice += order.totalPrice();
    }
  }
}
