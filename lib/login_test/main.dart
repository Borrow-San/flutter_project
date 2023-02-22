import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    Future<Map> getData() async {
      Map loginInfo = {'user_email': 'hmue@test.com', 'password': '12qw'};
      final response = await Dio().post(
        'http://10.0.2.2:8000/users/login',
        data: jsonEncode(loginInfo),
      );
      return response.data;
    }

    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        return Scaffold(
          body: Center(
            child: Text(
              "발급된 토큰 출력\n${snapshot.data.toString()}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
