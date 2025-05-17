import 'package:flutter/material.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  final List<String> _foodCategory = [
    "Petit Dejeuners",
    "Boissons",
    "Tea Time",
    "Food",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Center(
          child: GridView.builder(
            shrinkWrap: true, // important to prevent full expansion
            physics: NeverScrollableScrollPhysics(), // disable scrolling
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: _foodCategory.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(_foodCategory[index]);
                },
                child: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(_foodCategory[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
