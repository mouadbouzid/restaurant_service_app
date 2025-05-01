import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/food_with_quantity_model.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    super.key,
    required this.foodWithQuantityModel,
  });

  final FoodWithQuantityModel foodWithQuantityModel;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          widget.foodWithQuantityModel.foodModel.image,
          width: 60,
          height: 60,
        ),
        title: Text(
          widget.foodWithQuantityModel.foodModel.name,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(" ${widget.foodWithQuantityModel.totalPrice()} Dh"),
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
                  widget.foodWithQuantityModel.qauntity += 1;
                  setState(() {});
                },
                icon: Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Text(
                "${widget.foodWithQuantityModel.qauntity}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  if (widget.foodWithQuantityModel.qauntity == 0) {
                  } else {
                    widget.foodWithQuantityModel.qauntity -= 1;
                    setState(() {});
                  }
                },
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
