import 'package:flutter/material.dart';

class TitleInput extends StatelessWidget {
  const TitleInput(
      {super.key,
      required this.controller,
      required this.title,
      required this.hintText,
      required this.inputType,
      required this.readOnly});

  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType inputType;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          cursorColor: Colors.blueGrey,
          keyboardType: inputType,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              height: 1,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:
                  BorderSide(color: Colors.grey, width: 1.0), // same as enabled
            ),
          ),
        )
      ],
    );
  }
}
