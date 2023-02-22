import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/const/constants.dart';
import 'package:flutter_project/screen/1_start.dart';
import 'package:flutter_project/screen/3_signup.dart';
import 'package:flutter_project/widgets/basic_button.dart';
import 'package:flutter_project/widgets/input_box.dart';
import 'package:flutter_project/widgets/logo.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String user_email = '';
  String password = '';
  bool logoAppear = true;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
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
              showLogo(),
              InputBox(
                hintText: "아이디",
                onTap: () {
                  setState(() {
                    logoAppear = false;
                  });
                },
                onChanged: (String value) {
                  user_email = value;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              InputBox(
                hintText: "비밀번호",
                onTap: () {
                  setState(() {
                    logoAppear = false;
                  });
                },
                onChanged: (String value) {
                  password = value;
                },
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
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
                    child: BasicButton(
                      buttonTitle: "로그인",
                      onPressed: () {
                        postLoginInfo();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: BasicButton(
                      buttonTitle: "계정 찾기",
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Start(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BasicButton(
                buttonTitle: "회원가입",
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showLogo() {
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

  Future<Map> postLoginInfo() async {
    Map loginInfo = {
      'user_email': user_email,
      'password': password,
    };
    final response = await Dio().post(
      'http://10.0.2.2:8000/users/login',
      data: jsonEncode(loginInfo),
    );
    return response.data;
  }
}