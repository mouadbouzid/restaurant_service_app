import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/food_category_enum.dart';
import 'package:restaurant_service/data/models/food_model.dart';
import 'package:restaurant_service/data/models/food_with_quantity_model.dart';
import 'package:restaurant_service/data/models/oder_model.dart';
import 'package:restaurant_service/screens/widgets/order_card.dart';

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
        image:
            "https://assets.tmecosys.com/image/upload/t_web_rdp_recipe_584x480_1_5x/img/recipe/ras/Assets/48a49653c8716457eb0b2f7eb3c7d74c/Derivates/8d83d9ed4567fa15456d8eec7557e60006a15576.jpg",
        name: "Pizza",
        price: 19),
  );

  OrderModel orderrr = OrderModel();

  @override
  void initState() {
    super.initState();
    orderrr.addFood(foodWithQuantityModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            OrderCard(foodWithQuantityModel: foodWithQuantityModel),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.red, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20)),
                height: 40,
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.red,
                    size: 35,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Prix :",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Spacer(),
                  Text("${orderrr.ordersPrice()} Dh",
                      style: TextStyle(color: Colors.white, fontSize: 18))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
