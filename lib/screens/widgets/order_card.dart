import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/food_with_quantity_model.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.foodWithQuantityModel,
  });

  final FoodWithQuantityModel foodWithQuantityModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          foodWithQuantityModel.foodModel.image,
          width: 60,
          height: 60,
        ),
        title: Text(
          foodWithQuantityModel.foodModel.name,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(" ${foodWithQuantityModel.totalPrice()} Dh"),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 40,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      foodWithQuantityModel.qauntity += 1;
                      print(foodWithQuantityModel.qauntity);
                    },
                    icon: Icon(
                      Icons.add_circle_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Text(
                    "${foodWithQuantityModel.qauntity}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {
                      if (foodWithQuantityModel.qauntity == 0) {
                      } else {
                        foodWithQuantityModel.qauntity -= 1;
                      }
                      print(foodWithQuantityModel.qauntity);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
