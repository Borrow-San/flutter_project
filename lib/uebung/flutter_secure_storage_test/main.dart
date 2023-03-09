import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "데이터 저장 테스트",
            ),
            FutureBuilder(
                future: FlutterSecureStorage().readAll(),
                builder: (context, snapshot) {
                  return Text("데이터 값 : ${snapshot.data}");
                }),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  FlutterSecureStorage().write(key: "harry", value: "potter");
                });

              },
              child: Text("데이터 저장"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  FlutterSecureStorage().deleteAll();
                });
              },
              child: Text("데이터 삭제"),
            ),
          ],
        ),
      ),
    );
  }
}
