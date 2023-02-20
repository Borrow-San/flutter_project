import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/home_screen_buttons.dart';
import 'package:flutter_project/screen/10_claim.dart';
import 'package:flutter_project/screen/11_menu.dart';
import 'package:flutter_project/screen/12_user_profile.dart';
import 'package:flutter_project/screen/13_modify_user_info.dart';
import 'package:flutter_project/screen/14_modify_pay_info.dart';
import 'package:flutter_project/screen/15_alert_board.dart';
import 'package:flutter_project/screen/16_how_to_use.dart';
import 'package:flutter_project/screen/17_require_board.dart';
import 'package:flutter_project/screen/1_start.dart';
import 'package:flutter_project/screen/2_login.dart';
import 'package:flutter_project/screen/3_signup.dart';
import 'package:flutter_project/screen/4_loading.dart';
import 'package:flutter_project/screen/5_main_before_rent.dart';
import 'package:flutter_project/screen/6_scan.dart';
import 'package:flutter_project/screen/7_code_input.dart';
import 'package:flutter_project/screen/8_main_during_rent.dart';
import 'package:flutter_project/screen/9_umb_pohto.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeScreenButton(
                buttonName: "시작화면",
                page: Start(),
              ),
              HomeScreenButton(
                buttonName: "로그인",
                page: Login(),
              ),
              HomeScreenButton(buttonName: "회원가입", page: SignUp()),
              HomeScreenButton(
                buttonName: "로딩",
                page: Loading(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeScreenButton(
                buttonName: "메인(대여 전)",
                page: MainBfRent(),
              ),
              HomeScreenButton(
                buttonName: "QR 스캔",
                page: Scan(),
              ),
              HomeScreenButton(
                buttonName: "코드 입력",
                page: CodeInput(),
              ),
              HomeScreenButton(
                buttonName: "메인(대여 중)",
                page: MainDrRent(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeScreenButton(
                buttonName: "우산 촬영",
                page: UmbPhoto(),
              ),
              HomeScreenButton(
                buttonName: "오류 보고",
                page: Claim(),
              ),
              HomeScreenButton(
                buttonName: "메뉴",
                page: Menu(),
              ),
              HomeScreenButton(
                buttonName: "사용자 프로필",
                page: UserProfile(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeScreenButton(
                buttonName: "회원 정보 수정",
                page: ModifyUserInfo(),
              ),
              HomeScreenButton(
                buttonName: "카드 정보 수정",
                page: ModifyPayInfo(),
              ),
              HomeScreenButton(
                buttonName: "공지사항",
                page: AlertBoard(),
              ),
              HomeScreenButton(
                buttonName: "이용방법",
                page: HowToUse(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeScreenButton(
                buttonName: "문의 내역",
                page: RequireBoard(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
