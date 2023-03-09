import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onSaved: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  labelText: '이메일',
                  hintText: '이메일을 입력해 주세요',
                ),
                // null이 return 되면 에러가 없다.
                // 에러가 있으면 에러를 String 값으로 리턴해준다.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력해 주세요';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                onSaved: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  hintText: '비밀번호를 입력해 주세요',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력해 주세요';
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                onPressed: onLoginPressed,
                child: Text("로그인"),
              ),
              FutureBuilder(
                future: FlutterSecureStorage().readAll(),
                builder: (context, snapshot) {
                  return ElevatedButton(
                    onPressed: () {
                      if (snapshot.data != null) {
                        Map logoutInfo = {"token": snapshot.data!['token']};
                        Dio().post(
                          // 로컬 애뮬레이터 주소
                          //'http://10.0.2.2:8000/users/logout',
                          // 서버 IP 주소
                          'http://192.168.0.22:8000/users/logout',
                          data: jsonEncode(logoutInfo),
                        );
                        setState(
                          () {
                            FlutterSecureStorage().delete(key: "token");
                          },
                        );
                      }
                    },
                    child: Text("로그아웃"),
                  );
                },
              ),
              FutureBuilder(
                future: FlutterSecureStorage().readAll(),
                builder: (context, snapshot) {
                  return Text("데이터 값 : ${snapshot.data}");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLoginPressed() async {
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Map loginInfo = {'email': email, 'password': password};
      final response = await Dio().post(
        // 로컬 애뮬레이터 주소
        //'http://10.0.2.2:8000/users/login',
        // 서버 IP 주소
        'http://192.168.0.22:8000/users/login',
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
  }
}
