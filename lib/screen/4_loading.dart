import 'package:flutter/material.dart';
import 'package:flutter_project/const/constants.dart';
import 'package:flutter_project/widgets/logo.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로딩"),
      ),
      backgroundColor: MAIN_COLOR,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Logo(),],
        ),
      ),
    );
  }
}
