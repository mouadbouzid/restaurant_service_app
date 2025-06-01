import 'dart:io';

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
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image(
                    image: FileImage(File(manageFood.allProdacts[index].image)),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image, size: 40);
                    },
                  ),
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
