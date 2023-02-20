import 'package:flutter/material.dart';

class HomeScreenButton extends StatelessWidget {
  final String buttonName;
  final Widget page;

  const HomeScreenButton({super.key, required this.buttonName, required this.page});

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => page,
            ),
          );
        },
        child: Text(buttonName),
      );
  }
}
