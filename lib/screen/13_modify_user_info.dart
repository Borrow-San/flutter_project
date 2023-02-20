import 'package:flutter/material.dart';

class ModifyUserInfo extends StatelessWidget {
  const ModifyUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원 정보 수정"),
      ),
    );
  }
}
