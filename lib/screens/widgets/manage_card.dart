import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/manage_food.dart';

class ManageCard extends StatelessWidget {
  final ManageFood manageFood;

  const ManageCard({
    super.key,
    required this.manageFood,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: manageFood.allProdacts.length,
        itemBuilder: (BuildContext content, int index) {
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 60,
                height: 60,
                child: Image.network(
                  manageFood.allProdacts[index].image,
                ),
              ),
              title: Text(
                manageFood.allProdacts[index].name,
                style: TextStyle(fontSize: 20),
              ),
              trailing: Text(
                " ${manageFood.allProdacts[index].price} Dh",
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        });
  }
}
