import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/oder_model.dart';

class OrderCard extends StatefulWidget {
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
                width: 60,
                height: 60,
                child: Image.network(
                  widget.oders.allOrders[index].foodModel.image,
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
                        if (widget.oders.allOrders[index].qauntity == 1) {
                          widget.oders.deleteFood(
                              widget.oders.allOrders[index].foodModel.id!);
                          setState(() {});
                          widget.onQuantityChanged();
                        } else {
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
                        widget.onQuantityChanged();
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
