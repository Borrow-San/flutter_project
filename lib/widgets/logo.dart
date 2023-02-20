import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/img/vector.png',
          height: 150.0,
          width: 150.0,
        ),
        Text(
          "Borrow-San",
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
