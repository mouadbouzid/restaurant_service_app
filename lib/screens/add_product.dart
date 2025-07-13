import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_service/data/models/enum/food_category_enum.dart';
import 'package:restaurant_service/data/models/food_model.dart';
import 'package:restaurant_service/data/models/manage_food.dart';
import 'package:restaurant_service/screens/widgets/pick_image_widget.dart';
import 'package:restaurant_service/screens/widgets/title_input.dart';

// StatefulWidget for adding new products to the restaurant menu
class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController imageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  FoodCategory selectedCategory = FoodCategory.food;

  final foodManager = ManageFood();
  File? image;
  // Image picker instance for selecting images from gallery
  final _picker = ImagePicker();

  @override
  void dispose() {
    super.dispose();
    imageController;
    nameController;
    priceController;
  }

  // Method to pick image from device gallery
  pickImage() async {
    final pickFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      // Create File object from selected image path
      image = File(pickFile.path);
      // Store the image path in the controller for form validation
      imageController.text = pickFile.path;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Product"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: image == null
                  ? SizedBox(
                      width: double.infinity,
                      height: 140,
                      child: Center(
                        child: PickImageWidget(
                          onTap: () {
                            pickImage();
                          },
                        ),
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: 140,
                      child: Center(
                        child: SizedBox(
                          width: 130,
                          height: 130,
                          child: CircleAvatar(
                            backgroundImage: FileImage(File(image!.path)),
                          ),
                        ),
                      ),
                    ),
            ),
            TitleInput(
                controller: nameController,
                readOnly: false,
                title: "Name",
                hintText: "Enter name",
                inputType: TextInputType.text),
            TitleInput(
                controller: priceController,
                readOnly: false,
                title: "Price",
                hintText: "Enter price",
                inputType: TextInputType.number),
            SizedBox(height: 10),
            Text(
              'Catogry :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField2<FoodCategory>(
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
              hint: Text('Select Category'),
              // Create dropdown items from FoodCategory enum values
              items: FoodCategory.values
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (nameController.text.isEmpty ||
                      imageController.text.isEmpty ||
                      priceController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please fill in all the fields')));
                    return;
                  }

                  final food = FoodModel(
                    name: nameController.text.trim(),
                    image: imageController.text.trim(),
                    price: double.tryParse(priceController.text.trim()) ?? 0,
                    foodCategory: selectedCategory,
                  );

                  int response = await foodManager.addFood(food);
                  if (response != 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Product added successfully')));
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to add product')));
                  }
                },
                child: Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
