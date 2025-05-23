import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/manage_food.dart';
import 'package:restaurant_service/screens/widgets/manage_card.dart';

class Menu extends StatelessWidget {
  Menu({super.key});

  final manageFood = ManageFood();

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
