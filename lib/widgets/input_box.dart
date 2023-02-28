import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final FormFieldSetter<String> onSaved;

  final GestureTapCallback? onTap;
  final String hintText;
  final String? labelText;
  final String isValidatorValueEmpty;

  const InputBox({
    Key? key,
    required this.hintText,
    this.onTap,
    this.labelText,
    required this.onSaved,
    required this.isValidatorValueEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.5),
      child: TextFormField(
        onSaved: onSaved,
        onTap: onTap,
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none),
          hintText: hintText,
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return isValidatorValueEmpty;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
