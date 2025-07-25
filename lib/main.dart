import 'package:flutter/material.dart';
import 'package:restaurant_service/layout.dart';

void main() {
  runApp(const RestaurantService());
}

class RestaurantService extends StatelessWidget {
  const RestaurantService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutApp(),
    );
  }
}
