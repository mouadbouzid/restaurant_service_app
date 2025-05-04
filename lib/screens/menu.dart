import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/food_category_enum.dart';
import 'package:restaurant_service/data/models/food_model.dart';
import 'package:restaurant_service/data/models/manage_food.dart';
import 'package:restaurant_service/screens/widgets/manage_card.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final ManageFood manageFood = ManageFood();

  var food1 = FoodModel(
      foodCategory: FoodCategory.boissons,
      image:
          "https://www.pizzeriagranby.ca/wp-content/uploads/2020/10/cocacola.jpg",
      name: "cola",
      price: 19);
  var food2 = FoodModel(
      foodCategory: FoodCategory.food,
      image:
          "https://assets.tmecosys.com/image/upload/t_web_rdp_recipe_584x480_1_5x/img/recipe/ras/Assets/48a49653c8716457eb0b2f7eb3c7d74c/Derivates/8d83d9ed4567fa15456d8eec7557e60006a15576.jpg",
      name: "pizza",
      price: 29);
  @override
  void initState() {
    super.initState();
    manageFood.addFood(food1);
    manageFood.addFood(food2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Le menu"),
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
                child: ManageCard(
              manageFood: manageFood,
            )),
          ],
        ),
      ),
    );
  }
}
