import 'package:flutter/material.dart';
import 'package:flutter_project/const/constants.dart';
import 'package:flutter_project/screen/1_start.dart';
import 'package:flutter_project/screen/3_signup.dart';
import 'package:flutter_project/screen/5_main_before_rent.dart';
import 'package:flutter_project/widgets/basic_button.dart';
import 'package:flutter_project/widgets/input_box.dart';
import 'package:flutter_project/widgets/logo.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인"),
      ),
      backgroundColor: MAIN_COLOR,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Logo(),
              SizedBox(
                height: 50.0,
              ),
              InputBox(hintText: "아이디",),
              SizedBox(
                height: 10.0,
              ),
              InputBox(hintText: "비밀번호",),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value){}),
                  Text('자동 로그인'),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: BasicButton(buttonTitle: "로그인", page: MainBfRent(),),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: BasicButton(buttonTitle: "계정 찾기", page: Start(),),
                  ),
                ],
              ),
              BasicButton(
                buttonTitle: "회원가입",
                page: SignUp(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


