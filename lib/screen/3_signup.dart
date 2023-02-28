import 'package:flutter/material.dart';
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
              labelText: "이름",
              onSaved: (value) {},
              hintText: "이름",
              isValidatorValueEmpty: "이름을 입력해 주세요",
            ),
            Row(
              children: [
                Flexible(
                  child: InputBox(
                    labelText: "이메일",
                    onSaved: (value) {},
                    hintText: "이메일",
                    isValidatorValueEmpty: "이메일을 입력해 주세요",
                  ),
                ),
                DuplicateCheckButton(),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: InputBox(
                    labelText: "아이디",
                    onSaved: (value) {},
                    hintText: "아이디",
                    isValidatorValueEmpty: "아이디를 입력해 주세요",
                  ),
                ),
                DuplicateCheckButton(),
              ],
            ),
            InputBox(
              labelText: "비밀번호",
              onSaved: (value) {},
              hintText: "비밀번호",
              isValidatorValueEmpty: "비밀번호를 입력해 주세요",
            ),
            InputBox(
              labelText: "비밀번호 확인",
              onSaved: (value) {},
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
