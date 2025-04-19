import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/food_category_enum.dart';
import 'package:restaurant_service/data/models/food_model.dart';
import 'package:restaurant_service/data/models/food_with_quantity_model.dart';
import 'package:restaurant_service/data/models/oder_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FoodWithQuantityModel foodWithQuantityModel = FoodWithQuantityModel(
      qauntity: 1,
      foodModel: FoodModel(
          foodCategory: FoodCategory.food,
          image: "image",
          name: "Pizza",
          price: 19));
  OrderModel orderrr = OrderModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderrr.addFood(foodWithQuantityModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orderrr.allOrders.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 59,
                  color: Colors.amber,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
