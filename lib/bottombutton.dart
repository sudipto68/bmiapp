import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.titletext});

  final Function onTap;
  final String titletext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
        child:
        Center(
          child: Text(titletext,
          style:
          TextStyle(
          fontSize: 30.0, 
          fontWeight: FontWeight.w900,
          ),
          ),
        ),
        margin: EdgeInsets.only(top: 8.0),
        padding: EdgeInsets.all(10.0),
        color: kbottomcontainercolor,
        width: double.infinity,
        height: 60.0,
      ),
    );
  }
}