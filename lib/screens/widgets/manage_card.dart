import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/manage_food.dart';

// A StatelessWidget that displays a list of all food products in card format
// This widget is used to show food items with their images, names, and prices
// in a scrollable list view for management purposes
class ManageCard extends StatelessWidget {
  final ManageFood manageFood;

  const ManageCard({
    super.key,
    required this.manageFood,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: manageFood.allProducts.length,
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
                    // Load image from file path stored in product data
                    image: FileImage(File(manageFood.allProducts[index].image)),
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
                manageFood.allProducts[index].name,
                style: TextStyle(fontSize: 20),
              ),
              trailing: Text(
                " ${manageFood.allProducts[index].price} Dh",
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        });
  }
}
