import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/food_category_enum.dart';
import 'package:restaurant_service/data/models/food_model.dart';
import 'package:restaurant_service/data/models/manage_food.dart';
import 'package:restaurant_service/layout.dart';
import 'package:restaurant_service/screens/widgets/title_input.dart';

class EditPrice extends StatefulWidget {
  const EditPrice({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  State<EditPrice> createState() => _EditPriceState();
}

class _EditPriceState extends State<EditPrice> {
  TextEditingController imageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  FoodCategory foodCategory = FoodCategory.food;
  final foodManager = ManageFood();

  @override
  void initState() {
    super.initState();
    imageController.text = widget.foodModel.image;
    nameController.text = widget.foodModel.name;
    priceController.text = widget.foodModel.price.toString();
    foodCategory = widget.foodModel.foodCategory;
  }

  @override
  void dispose() {
    imageController.dispose();
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajauter un produit"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 140,
              child: Center(
                child: SizedBox(
                  width: 130,
                  height: 130,
                  child: CircleAvatar(
                    backgroundImage: FileImage(File(widget.foodModel.image)),
                  ),
                ),
              ),
            ),
            TitleInput(
                controller: nameController,
                readOnly: true,
                title: "Le nome",
                hintText: widget.foodModel.name,
                inputType: TextInputType.text),
            TitleInput(
                controller: priceController,
                readOnly: false,
                title: "Nouveau prix",
                hintText: "enter nouveau prix",
                inputType: TextInputType.text),
            SizedBox(height: 10),
            Text(
              'Catogry :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              buttonStyleData: const ButtonStyleData(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              isExpanded: true,
              value: widget.foodModel.foodCategory, //  Show current category
              items: FoodCategory.values
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ))
                  .toList(),
              onChanged: null, //  Disable selection
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  foodManager.editPrice(
                    nameController.text,
                    double.tryParse(priceController.text) ?? 0.0,
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LayoutApp(initialIndex: 1)),
                    (route) => false,
                  );
                },
                child: Text("Ajouter"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
