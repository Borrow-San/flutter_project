import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/basic_button.dart';
import 'package:flutter_project/widgets/input_box.dart';
import 'package:flutter_project/widgets/show_logo.dart';

import '../const/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey();
  double height = 0;
  bool logoAppear = true;
  String? email;
  String? password;
  String? passwordCheck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입"),
      ),
      backgroundColor: MAIN_COLOR,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40.0),
                showLogo(logoAppear),
                Row(
                  children: [
                    Flexible(
                      child: InputBox(
                        onTap: () {
                          setState(() {
                            logoAppear = false;
                          });
                        },
                        obscureText: false,
                        labelText: "이메일",
                        onSaved: (value) {
                          email = value;
                        },
                        hintText: "이메일",
                        isValidatorValueEmpty: "이메일을 입력해 주세요",
                      ),
                    ),
                    DuplicateCheckButton(),
                  ],
                ),
                InputBox(
                  obscureText: true,
                  labelText: "비밀번호",
                  onSaved: (value) {
                    password = value;
                  },
                  hintText: "비밀번호",
                  isValidatorValueEmpty: "비밀번호를 입력해 주세요",
                ),
                InputBox(
                  obscureText: true,
                  labelText: "비밀번호 확인",
                  onSaved: (value) {
                    passwordCheck = value;
                  },
                  hintText: "비밀번호 확인",
                  isValidatorValueEmpty: "비밀번호를 한번 더 입력해 주세요",
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text('가입 정보 이용에 동의'),
                  ],
                ),
                BasicButton(
                  buttonTitle: "회원가입",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      print("email : $email");
                      print("password : $password");
                      print("passwordCheck : $passwordCheck");
                    }
                    if (password != passwordCheck) {
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
                    } else {
                      Map signupInfo = {'email': email, 'password': password};
                      final response = await Dio().post(
                        'http://10.0.2.2:8000/users/register',
                        data: jsonEncode(signupInfo),
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
                      } else if (response.data['msg'] ==
                          "SUCCESS: 회원가입이 완료되었습니다") {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("회원가입이 완료되었습니다."),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => Login(),
                                    //   ),
                                    // );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("확인"),
                                )
                              ],
                            );
                          },
                        );
                      } else if (response.data['msg'] ==
                          "FAILURE: 회원가입이 실패하였습니다") {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("회원가입이 실패하였습니다"),
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
                      } else if (response.data['msg'] ==
                          "FAILURE: 이메일이 이미 존재합니다") {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("이메일이 이미 존재합니다"),
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
                      }
                    }
                  },
                ),
                SizedBox(height: height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DuplicateCheckButton extends StatelessWidget {
  const DuplicateCheckButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text("중복확인"),
      style: ElevatedButton.styleFrom(
        backgroundColor: SUB_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
