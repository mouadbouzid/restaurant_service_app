import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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
                leading: Image.asset("assets/icons/food_menu.png"),
                title: Text("tous les produits"),
                subtitle: Text("just test"),
                trailing: Icon(Iconsax.direct_right),
              ),
            ),
          Card(
            child: ListTile(
              leading: Image.asset("assets/icons/food_menu.png"),
              title: Text("tous les produits"),
              subtitle: Text("just test"),
              trailing: Icon(Iconsax.direct_right),
            ),
          ),Card(
            child: ListTile(
              leading: Image.asset("assets/icons/food_menu.png"),
              title: Text("tous les produits"),
              subtitle: Text("just test"),
              trailing: Icon(Iconsax.direct_right),
            ),
          ),


        ],
      ),
    );
  }
}
