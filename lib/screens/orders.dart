import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/manage_food.dart';
import 'package:restaurant_service/data/models/oder_model.dart';
import 'package:restaurant_service/screens/choosing_a_category.dart';
import 'package:restaurant_service/screens/widgets/order_card.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  OrderModel orderrr = OrderModel();
  ManageFood manageFood = ManageFood();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFoods();
  }

  Future<void> _loadFoods() async {
    await manageFood.loadFoods();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  orderrr.deleteAllFood();
                });
              },
              child: Text(
                "supprimer",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          )
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                    child: OrderCard(
                      oders: orderrr,
                      onQuantityChanged: () {
                        setState(
                            () {}); // rebuilds the Orders screen to update price
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChoosingACategory()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.red, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(20)),
                      height: 40,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Prix :",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Spacer(),
                        Text("${orderrr.ordersPrice()} Dh",
                            style: TextStyle(color: Colors.white, fontSize: 18))
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
