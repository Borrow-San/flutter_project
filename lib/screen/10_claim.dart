import 'package:flutter/material.dart';
import 'package:flutter_project/const/constants.dart';
import 'package:flutter_project/screen/8_main_during_rent.dart';

class Claim extends StatelessWidget {
  const Claim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "오류 보고",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: MAIN_COLOR,
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ExpansionTile(
              children: [
                Text("회원정보 관련", style: TextStyle(fontSize: 20)),
                Text("결제 관련", style: TextStyle(fontSize: 20)),
                Text("대여 관련", style: TextStyle(fontSize: 20)),
              ],
              collapsedBackgroundColor: Colors.white,
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: Colors.white),
              ),
              title: Text(
                "오류 유형",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextFormField(
                maxLines: 15,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "첨부파일",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => MainDrRent(),),
                );
              },
              child: Text(
                "오류신고",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
