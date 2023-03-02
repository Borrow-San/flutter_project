import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/logo.dart';


Widget showLogo(logoAppear) {
  if (logoAppear) {
    return Column(
      children: [
        Logo(),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  } else {
    return SizedBox(
      height: 20.0,
    );
  }
}