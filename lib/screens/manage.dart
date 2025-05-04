import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:restaurant_service/screens/menu.dart';

class Manage extends StatelessWidget {
  const Manage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Menu()));
              },
              leading: Image.asset("assets/icons/food_menu.png"),
              title: Text("Le Menu"),
              trailing: Icon(Iconsax.direct_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset("assets/icons/food_menu.png"),
              title: Text("Ajouter un produit"),
              trailing: Icon(Iconsax.direct_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset("assets/icons/food_menu.png"),
              title: Text("Modifier le prix"),
              trailing: Icon(Iconsax.direct_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset("assets/icons/food_menu.png"),
              title: Text("Supprimer un produi"),
              trailing: Icon(Iconsax.direct_right),
            ),
          ),
        ],
      ),
    );
  }
}
