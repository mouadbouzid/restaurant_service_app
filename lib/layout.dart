import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:restaurant_service/screens/orders.dart';
import 'package:restaurant_service/screens/manage.dart';

class LayoutApp extends StatefulWidget {
  const LayoutApp({super.key});

  @override
  State<LayoutApp> createState() => _LayoutAppState();
}

class _LayoutAppState extends State<LayoutApp> {
  int _index = 0;

  final List<Widget> _pages = [
    Orders(),
    Manage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_index),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (value) {
            setState(() {
              _index = value;
            });
          },
          destinations: [
            NavigationDestination(
                icon: Icon(_index == 0
                    ? Iconsax.shopping_bag
                    : Iconsax.shopping_bag_copy),
                label: 'Commandes'),
            NavigationDestination(
                icon: Icon(_index == 1 ? Iconsax.edit : Iconsax.edit_2),
                label: 'Gérer')
          ]),
    );
  }
}
