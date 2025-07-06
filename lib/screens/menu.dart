import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/manage_food.dart';
import 'package:restaurant_service/screens/widgets/manage_card.dart';

class Menu extends StatefulWidget {
  Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final manageFood = ManageFood();

  @override
  void initState() {
    super.initState();
    _loadFoods();
  }

  Future<void> _loadFoods() async {
    await manageFood.loadFoods();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
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
                child: ManageCard(
              manageFood: manageFood,
            )),
          ],
        ),
      ),
    );
  }
}
