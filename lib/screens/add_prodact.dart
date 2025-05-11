import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_service/data/models/food_category_enum.dart';
import 'package:restaurant_service/screens/widgets/title_input.dart';

class AddProdact extends StatefulWidget {
  const AddProdact({super.key});

  @override
  State<AddProdact> createState() => _AddProdactState();
}

class _AddProdactState extends State<AddProdact> {
  TextEditingController imageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    imageController;
    nameController;
    priceController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajauter un produit"),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 14, left: 14, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleInput(
                controller: imageController,
                title: "L'image",
                hintText: "enter URL d'image",
                inputType: TextInputType.text),
            TitleInput(
                controller: nameController,
                title: "Le nome",
                hintText: "enter le nome",
                inputType: TextInputType.text),
            TitleInput(
                controller: priceController,
                title: "Le prixe",
                hintText: "enter le prixe",
                inputType: TextInputType.text),
            SizedBox(
              height: 10,
            ),
            Text(
              'Catogry :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              buttonStyleData: const ButtonStyleData(
                height: 50, // <-- change this to your desired field height
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              isExpanded: true, // FULL WIDTH
              hint: Text('Select Category'),
              items: FoodCategory.values
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ))
                  .toList(),
              onChanged: (value) {
                // handle selection
              },
            ),
          ],
        ),
      ),
    );
  }
}
