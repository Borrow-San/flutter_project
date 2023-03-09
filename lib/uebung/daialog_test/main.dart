import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            "다이얼로그 열기",
          ),
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
              builder: ((context) {
                return AlertDialog(
                  title: Text("제목"),
                  content: Text("내용"),
                  actions: <Widget>[
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); //창 닫기
                        },
                        child: Text("네"),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); //창 닫기
                        },
                        child: Text("아니요"),
                      ),
                    ),
                  ],
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
