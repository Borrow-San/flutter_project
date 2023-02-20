import 'package:flutter/material.dart';
import 'package:flutter_project/screen/12_user_profile.dart';
import 'package:flutter_project/screen/14_modify_pay_info.dart';
import 'package:flutter_project/screen/15_alert_board.dart';
import 'package:flutter_project/screen/16_how_to_use.dart';
import 'package:flutter_project/screen/17_require_board.dart';
import 'package:flutter_project/screen/home_screen.dart';
import 'package:flutter_project/widgets/menu_button.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메뉴"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: Text('안녕하세요, 사용자 님'),
            ),
          ),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '서비스 설정',
                      ),
                    ),
                  ),
                  MenuButton(
                    text: "내 정보 관리",
                    page: UserProfile(),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  MenuButton(
                    text: '결제 수단 관리',
                    page: ModifyPayInfo(),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  MenuButton(
                    text: '알림설정',
                    page: HomeScreen(),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '서비스 안내',
                      ),
                    ),
                  ),
                  MenuButton(
                    text: '공지사항',
                    page: AlertBoard(),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  MenuButton(
                    text: '이용방법',
                    page: HowToUse(),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  MenuButton(
                    text: '내 문의 내역',
                    page: RequireBoard(),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
