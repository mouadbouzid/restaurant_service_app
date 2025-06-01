import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/food_category_enum.dart';
import 'package:restaurant_service/data/models/food_model.dart';
import 'package:restaurant_service/data/models/food_with_quantity_model.dart';
import 'package:restaurant_service/data/models/manage_food.dart';
import 'package:restaurant_service/data/models/oder_model.dart';
import 'package:restaurant_service/layout.dart';

class AddOder extends StatefulWidget {
  final FoodCategory category;
  const AddOder({super.key, required this.category});

  @override
  State<AddOder> createState() => _AddOderState();
}

class _AddOderState extends State<AddOder> {
  final manageFood = ManageFood();
  List<FoodModel> specificProducts = [];
  OrderModel orderModel = OrderModel();

  @override
  void initState() {
    super.initState();
    _loadSpecificProducts();
  }

  Future<void> _loadSpecificProducts() async {
    await manageFood.loadFoods(); //This actually loads products from SQLite
    specificProducts = manageFood.allProdacts
        .where((it) => it.foodCategory.name == widget.category.name)
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sélection de produits"),
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
              child: ListView.builder(
                itemCount: specificProducts.length,
                itemBuilder: (BuildContext content, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        orderModel.addFood(FoodWithQuantityModel(
                            qauntity: 1,
                            foodModel: FoodModel(
                                id: specificProducts[index].id,
                                foodCategory:
                                    specificProducts[index].foodCategory,
                                image: specificProducts[index].image,
                                name: specificProducts[index].name,
                                price: specificProducts[index].price)));
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LayoutApp(initialIndex: 0)),
                          (route) => false,
                        );

                        setState(() {});
                      },
                      leading: SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.network(
                          specificProducts[index].image,
                        ),
                      ),
                      title: Text(
                        specificProducts[index].name,
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Text(
                        " ${specificProducts[index].price} Dh",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
