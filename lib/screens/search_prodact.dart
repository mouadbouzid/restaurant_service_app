import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/food_model.dart';
import 'package:restaurant_service/data/models/manage_food.dart';
import 'package:restaurant_service/screens/edit_price.dart';

class SearchProdact extends StatefulWidget {
  const SearchProdact({super.key});

  @override
  State<SearchProdact> createState() => _SearchProdactState();
}

class _SearchProdactState extends State<SearchProdact> {
  final manageFood = ManageFood();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recherche de produits"),
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
                itemCount: manageFood.allProducts.length,
                itemBuilder: (BuildContext content, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (content) => EditPrice(
                              foodModel: FoodModel(
                                  foodCategory: manageFood
                                      .allProducts[index].foodCategory,
                                  image: manageFood.allProducts[index].image,
                                  name: manageFood.allProducts[index].name,
                                  price:
                                      manageFood.allProducts[index].price))));
                    },
                    child: Card(
                      child: ListTile(
                        leading: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image(
                            image: FileImage(
                                File(manageFood.allProducts[index].image)),
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.broken_image, size: 40);
                            },
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
