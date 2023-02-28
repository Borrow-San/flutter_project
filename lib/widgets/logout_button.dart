import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screen/1_start.dart';
import 'package:flutter_project/screen/2_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FlutterSecureStorage().readAll(),
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: () {
            if (snapshot.data != null) {
              Map logoutInfo = {"token": snapshot.data!['token']};
              Dio().post(
                'http://10.0.2.2:8000/users/logout',
                data: jsonEncode(logoutInfo),
              );
              setState(
                () {
                  FlutterSecureStorage().delete(key: "token");
                },
              );
            }
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text("로그아웃 되었습니다"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Start(),
                        ),
                      );
                    },
                    child: Text("확인"),
                  )
                ],
              );
            });
          },
          child: Text("로그아웃"),
        );
      },
    );
  }
}
