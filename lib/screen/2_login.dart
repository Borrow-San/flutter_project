import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/const/constants.dart';
import 'package:flutter_project/screen/1_start.dart';
import 'package:flutter_project/screen/3_signup.dart';
import 'package:flutter_project/screen/5_main_before_rent.dart';
import 'package:flutter_project/widgets/basic_button.dart';
import 'package:flutter_project/widgets/input_box.dart';
import 'package:flutter_project/widgets/logo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                showLogo(),
                InputBox(
                  onSaved: (value) {
                    email = value;
                  },
                  hintText: '이메일을 입력해 주세요',
                  isValidatorValueEmpty: '이메일을 입력해 주세요',
                  onTap: () {
                    setState(() {
                      logoAppear = false;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                InputBox(
                  onSaved: (value) {
                    password = value;
                  },
                  hintText: '비밀번호를 입력해 주세요',
                  isValidatorValueEmpty: '비밀번호를 입력해 주세요',
                  onTap: () {
                    setState(() {
                      logoAppear = false;
                    });
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
                        onPressed: onLoginPressed,
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

  void onLoginPressed() async {
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Map loginInfo = {'email': email, 'password': password};
      final response = await Dio().post(
        'http://10.0.2.2:8000/users/login',
        data: jsonEncode(loginInfo),
      );
      if (response.data['msg'] == null) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("서버가 반응하지 않습니다"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("확인"),
                )
              ],
            );
          },
        );
      } else if (response.data['msg'] == "FAILURE: 비밀번호가 일치하지 않습니다") {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("비밀번호가 일치하지 않습니다"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("확인"),
                )
              ],
            );
          },
        );
      } else if (response.data['msg'] == "FAILURE: 이메일 주소가 존재하지 않습니다") {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("이메일 주소가 존재하지 않습니다"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("확인"),
                )
              ],
            );
          },
        );
      } else {
        print("######response.data is ${response.data['msg']}######");
        setState(
          () {
            FlutterSecureStorage()
                .write(key: "token", value: response.data['msg']);
          },
        );
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("로그인 되었습니다."),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainBfRent(),
                    ),
                  ),
                  child: Text("확인"),
                )
              ],
            );
          },
        );
      }
    }
  }
}
