import 'package:flutter/material.dart';
import 'package:restaurant_service/layout.dart';
import 'package:restaurant_service/screens/home.dart';

void main() {
  runApp(const RestaurantService());
}

class RestaurantService extends StatelessWidget {
  const RestaurantService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LayoutApp(),
    );
  }
}
