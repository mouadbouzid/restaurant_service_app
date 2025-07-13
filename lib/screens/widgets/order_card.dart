import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/oder_model.dart';

// A StatefulWidget that displays a list of ordered food items with quantity controls
// This widget shows each order item with image, name, price, and interactive quantity buttons
// allowing users to increase/decrease quantities or remove items from the order
class OrderCard extends StatefulWidget {
  // Callback function triggered when quantity changes to update parent widget
  final VoidCallback onQuantityChanged;

  final OrderModel oders;

  const OrderCard({
    super.key,
    required this.oders,
    required this.onQuantityChanged,
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.oders.allOrders.length,
        itemBuilder: (BuildContext content, int index) {
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 40,
                height: 40,
                child: Image(
                  image: FileImage(
                      File(widget.oders.allOrders[index].foodModel.image)),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image, size: 40);
                  },
                ),
              ),
              title: Text(
                widget.oders.allOrders[index].foodModel.name,
                style: TextStyle(fontSize: 18),
              ),
              subtitle:
                  Text(" ${widget.oders.allOrders[index].foodModel.price} Dh"),
              trailing: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // If quantity is 1, remove item completely
                        if (widget.oders.allOrders[index].qauntity == 1) {
                          widget.oders.deleteFood(
                              widget.oders.allOrders[index].foodModel.id!);
                          setState(() {});
                          widget.onQuantityChanged();
                        } else {
                          // Otherwise, decrease quantity by 1
                          widget.oders.allOrders[index].qauntity--;
                          setState(() {});
                          widget.onQuantityChanged();
                        }
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Text(
                      "${widget.oders.allOrders[index].qauntity}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        widget.oders.allOrders[index].qauntity++;
                        setState(() {});
                        widget.onQuantityChanged(); // Notify parent widget
                      },
                      icon: Icon(
                        Icons.add_circle_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
