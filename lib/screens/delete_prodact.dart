import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/manage_food.dart';

class DeleteProdact extends StatelessWidget {
  DeleteProdact({super.key});

  final manageFood = ManageFood();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("suprimé de produits"),
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
              child: ListView.builder(
                itemCount: manageFood.allProdacts.length,
                itemBuilder: (BuildContext content, int index) {
                  return GestureDetector(
                    onTap: () {
                      manageFood.deleteFood(manageFood.allProdacts[index].name);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Le produit a été suprimé")));
                    },
                    child: Card(
                      child: ListTile(
                        leading: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image(
                            image: FileImage(
                                File(manageFood.allProdacts[index].image)),
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.broken_image, size: 40);
                            },
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
