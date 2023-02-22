import 'package:flutter/material.dart';

import '../const/constants.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;

  const BasicButton({Key? key, required this.buttonTitle, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: SUB_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}