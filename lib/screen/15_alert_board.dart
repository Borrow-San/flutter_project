import 'package:flutter/material.dart';

class AlertBoard extends StatelessWidget {
  const AlertBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("공지사항"),
      ),
    );
  }
}
