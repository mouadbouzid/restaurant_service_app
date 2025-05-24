import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:restaurant_service/screens/orders.dart';
import 'package:restaurant_service/screens/manage.dart';

class LayoutApp extends StatefulWidget {
  final int initialIndex;

  const LayoutApp({super.key, this.initialIndex = 0});

  @override
  State<LayoutApp> createState() => _LayoutAppState();
}

class _LayoutAppState extends State<LayoutApp> {
  late int _index;

  final List<Widget> _pages = [
    Orders(),
    Manage(),
  ];

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
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
        ],
      ),
    );
  }
}
