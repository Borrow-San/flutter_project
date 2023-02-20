import 'package:flutter/material.dart';
import 'package:flutter_project/screen/2_login.dart';
import 'package:flutter_project/screen/3_signup.dart';
import 'package:flutter_project/widgets/basic_button.dart';
import 'package:flutter_project/widgets/logo.dart';

import '../const/constants.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("시작화면"),
      ),
      backgroundColor: MAIN_COLOR,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Logo(),
              SizedBox(
                height: 150.0,
              ),
              BasicButton(
                buttonTitle: "로그인",
                page: Login(),
              ),
              BasicButton(
                buttonTitle: "회원가입",
                page: SignUp(),
              ),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
