import 'package:restaurant_service/data/models/food_with_quantity_model.dart';

class OrderModel {
  OrderModel._privateConstructor();
  static final OrderModel _instance = OrderModel._privateConstructor();
  factory OrderModel() {
    return _instance;
  }
  List<FoodWithQuantityModel> allOrders = [];
  double totalPrice = 0;

  void addFood(FoodWithQuantityModel foodWithQuantityModel) {
    allOrders.add(foodWithQuantityModel);
  }

  void deleteFood(int namber) {
    allOrders.removeWhere((item) => item.id == namber);
  }

  void deleteAllFood() {
    totalPrice = 0;
    allOrders.clear();
  }

  double ordersPrice() {
    for (var order in allOrders) {
      totalPrice += order.totalPrice();
    }
    return totalPrice;
  }
}
