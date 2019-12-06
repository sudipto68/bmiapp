import 'package:bmiapp/constant.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'reuseablecard.dart';
import 'bottombutton.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmiResult, this.resultText, this.interpretationText});

  final String bmiResult;
  final String resultText;
  final String interpretationText;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
               child: Text(
              'Your Result', style: kresultTitleStyle,),
            ),
            ),
            Expanded(
              flex: 4,
              child: Reuseablecard(colour: kactiveCardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: kinputTextstyle,),
                  Text(bmiResult, style: kbmiResultstyle,),
                  Text(interpretationText, textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0,)
                   ,),
                ],
              ),
              ),
            ),
             BottomButton(onTap: (){
             Navigator.pop(context);
            },
            titletext: 'RE-CALCULATE',),
        ],
      ),
    );
  }
}