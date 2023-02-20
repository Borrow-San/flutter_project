import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String hintText;

  const InputBox({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.5),
      child: TextFormField(
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        ),
      ),
    );
  }
}