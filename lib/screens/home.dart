import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/food_category_enum.dart';
import 'package:restaurant_service/data/models/food_model.dart';
import 'package:restaurant_service/data/models/food_with_quantity_model.dart';
import 'package:restaurant_service/data/models/oder_model.dart';
import 'package:restaurant_service/screens/widgets/order_card.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  FoodWithQuantityModel order1 = FoodWithQuantityModel(
    qauntity: 1,
    foodModel: FoodModel(
        foodCategory: FoodCategory.food,
        image:
            "https://assets.tmecosys.com/image/upload/t_web_rdp_recipe_584x480_1_5x/img/recipe/ras/Assets/48a49653c8716457eb0b2f7eb3c7d74c/Derivates/8d83d9ed4567fa15456d8eec7557e60006a15576.jpg",
        name: "Cola",
        price: 19),
  );
  FoodWithQuantityModel order2 = FoodWithQuantityModel(
    qauntity: 1,
    foodModel: FoodModel(
        foodCategory: FoodCategory.boissons,
        image:
            "https://www.pizzeriagranby.ca/wp-content/uploads/2020/10/cocacola.jpg",
        name: "Pizza",
        price: 19),
  );

  OrderModel orderrr = OrderModel();

  @override
  void initState() {
    super.initState();
    orderrr.addFood(order1);
    orderrr.addFood(order2);
    orderrr.addFood(order1);
    orderrr.addFood(order2);
    orderrr.addFood(order1);
    orderrr.addFood(order2);
    orderrr.addFood(order1);
    orderrr.addFood(order2);
    orderrr.addFood(order1);
    orderrr.addFood(order2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  orderrr.deleteAllFood();
                });
              },
              child: Text(
                "supprimer",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 18,
        ),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: OrderCard(oders: orderrr),
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
