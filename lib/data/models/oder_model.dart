import 'package:restaurant_service/data/models/food_with_quantity_model.dart';

class OrderModel {
  OrderModel._privateConstructor();
  static final OrderModel _instance = OrderModel._privateConstructor();
  factory OrderModel() {
    return _instance;
  }
  List<FoodWithQuantityModel> allOrders = [];

  void addFood(FoodWithQuantityModel foodWithQuantityModel) {
    allOrders.add(foodWithQuantityModel);
  }

  void deleteFood(int namber) {
    allOrders.removeWhere((item) => item.foodModel.id == namber);
  }

  void deleteAllFood() {
    allOrders.clear();
  }

  double ordersPrice() =>
      allOrders.fold(0, (sum, order) => sum + order.totalPrice());
}
