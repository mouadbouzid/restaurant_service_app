import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:restaurant_service/screens/add_product.dart';
import 'package:restaurant_service/screens/delete_product.dart';
import 'package:restaurant_service/screens/menu.dart';
import 'package:restaurant_service/screens/search_prodact.dart';

// StatelessWidget that serves as the main management dashboard
// Provides navigation to all restaurant management functions
class Manage extends StatelessWidget {
  const Manage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          spacing: 10,
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Menu()));
                },
                leading: Image.asset(
                  "assets/icons/food_menu.png",
                  width: 50,
                  height: 50,
                ),
                title: Text("Menu"),
                trailing: Icon(Iconsax.direct_right),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddProduct()));
                },
                leading: Image.asset(
                  "assets/icons/add_food.png",
                  width: 50,
                  height: 50,
                ),
                title: Text("Add Product"),
                trailing: Icon(Iconsax.direct_right),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchProdact()));
                },
                leading: Image.asset(
                  "assets/icons/edit_food.png",
                  width: 50,
                  height: 50,
                ),
                title: Text("Edit Price"),
                trailing: Icon(Iconsax.direct_right),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DeleteProduct()));
                },
                leading: Image.asset(
                  "assets/icons/delete_food.png",
                  width: 50,
                  height: 50,
                ),
                title: Text("Delete Product"),
                trailing: Icon(Iconsax.direct_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
