import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/enum/food_category_enum.dart';
import 'package:restaurant_service/screens/add_order.dart';

// StatelessWidget for displaying food categories in a grid layout
// Users can select a category to view products within that category
class ChoosingACategory extends StatelessWidget {
  ChoosingACategory({super.key});

  // List of food category names to display to users
  final List<String> _foodCategory = [
    "Petit Dejeuners",
    "Boissons",
    "Tea Time",
    "Food",
  ];

  // List of image file names corresponding to each food category
  // These images are stored in assets/images/ folder
  final List<String> foodCategoryImages = [
    "breakfast.png",
    "drinks.png",
    "tea_time.png",
    "food.png",
  ];

  // List of enum values that correspond to each category
  // Used for navigation and filtering products
  final List<FoodCategory> enumCategories = [
    FoodCategory.petitDejuners,
    FoodCategory.boissons,
    FoodCategory.teaTime,
    FoodCategory.food,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          AddOrder(category: enumCategories[index]),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 101, 95, 95),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Stack(
                      children: [
                        SizedBox.expand(
                          child: Image.asset(
                              "assets/images/${foodCategoryImages[index]}",
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover),
                        ),
                        Column(
                          children: [
                            Spacer(),
                            Container(
                              width: double.infinity,
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(196, 101, 95, 95),
                              ),
                              child: Center(
                                child: Text(
                                  _foodCategory[index],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
