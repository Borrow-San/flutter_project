import 'package:flutter/material.dart';
import 'package:flutter_project/screen/2_login.dart';
import 'package:flutter_project/widgets/basic_button.dart';
import 'package:flutter_project/widgets/input_box.dart';
import 'package:flutter_project/widgets/logo.dart';

import '../const/constants.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입"),
      ),
      backgroundColor: MAIN_COLOR,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Logo(),
            InputBox(
              hintText: "이름",
            ),
            Row(
              children: [
                Flexible(
                  child: InputBox(
                    hintText: "이메일",
                  ),
                ),
                DuplicateCheckButton(),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: InputBox(
                    hintText: "아이디",
                  ),
                ),
                DuplicateCheckButton(),
              ],
            ),
            InputBox(
              hintText: "비밀번호",
            ),
            InputBox(
              hintText: "비밀번호 확인",
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text('가입 정보 이용에 동의'),
              ],
            ),
            BasicButton(
              buttonTitle: "회원가입",
              page: Login(),
            ),
          ],
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
