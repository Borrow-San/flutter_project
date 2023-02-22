import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  final GestureTapCallback? onTap;
  final String hintText;

  const InputBox({
    Key? key,
    required this.hintText,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.5),
      child: TextFormField(
        onChanged: onChanged,
        onTap: onTap,
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
