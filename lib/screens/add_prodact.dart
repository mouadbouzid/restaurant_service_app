import 'package:flutter/material.dart';

class AddProdact extends StatefulWidget {
  const AddProdact({super.key});

  @override
  State<AddProdact> createState() => _AddProdactState();
}

class _AddProdactState extends State<AddProdact> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajauter un produit"),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 14, left: 14, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1, left: 1),
              child: Text(
                'Le nome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: nameController,
              cursorColor: Colors.blueGrey,
              decoration: InputDecoration(
                hintText: "enter Le nome",
                hintStyle: const TextStyle(
                  height: 1,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                      color: Colors.grey, width: 1.0), // same as enabled
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
