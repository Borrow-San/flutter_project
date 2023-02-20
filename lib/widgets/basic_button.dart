import 'package:flutter/material.dart';

import '../const/constants.dart';

class BasicButton extends StatelessWidget {
  final String buttonTitle;
  final Widget page;

  const BasicButton({Key? key, required this.buttonTitle, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => page,
          ),
        );
      },
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