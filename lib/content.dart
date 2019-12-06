import 'package:flutter/material.dart';
import 'constant.dart';


class Iconcontent extends StatelessWidget {
  
  Iconcontent({this.icon, this.lebel});
  final IconData icon;
  final String lebel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 70.0,
        ),
        SizedBox(
          height: 12.0
          ),
          Text(lebel, style: kcontentTextstyle),
      ],
    );
  }
}
