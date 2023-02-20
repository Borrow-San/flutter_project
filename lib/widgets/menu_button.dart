import 'package:flutter/material.dart';
import 'package:flutter_project/screen/12_user_profile.dart';

class MenuButton extends StatelessWidget {
  final String text;

  final Widget page;

  const MenuButton({Key? key, required this.text, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => page,),
              );
            },
            child: Icon(
              Icons.arrow_forward_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
