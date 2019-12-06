import 'package:flutter/material.dart';
import 'content.dart';
import 'constant.dart';
import 'reuseablecard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resultpage.dart';
import 'bottombutton.dart';
import 'calculatorBrain.dart';

enum Gender{
 male,
 female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
Gender selectedGender;
int height = 180;
int weight = 60;
int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuseablecard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardchild: Iconcontent(
                    icon: FontAwesomeIcons.mars,
                    lebel: 'Male',
                  ),
                  colour: selectedGender == Gender.male? kactiveCardcolor : kinactiveCardColor),
                ),
                Expanded(
                  child: Reuseablecard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardchild: Iconcontent(
                  icon: FontAwesomeIcons.venus,
                  lebel: 'Female',
                      ),
                    colour: selectedGender == Gender.female? kactiveCardcolor : kinactiveCardColor),),
              ],
            ),
          ),
          Expanded(
            child: Reuseablecard(
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("HEIGHT", style: kcontentTextstyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(), style: knumberTextstyle,),
                    Text('cm', style:kcontentTextstyle),
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),

                    ),
                    child: Slider(
                    value: height.toDouble(),
                    max: 220.0,
                    min: 120.0,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newvalue){
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            colour: kactiveCardcolor),),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuseablecard(
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: kcontentTextstyle,),
                      Text(weight.toString(), style: knumberTextstyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(icon: FontAwesomeIcons.minus,
                          onPress: (){
                            setState(() {
                              weight--;
                            });
                          },),
                          RoundButton(icon: FontAwesomeIcons.plus,
                          onPress: (){
                            setState(() {
                              weight++;
                            });
                          },),
                        ],
                      ),
                    ],
                  ),
                  colour: kactiveCardcolor),),

                Expanded(child: Reuseablecard(
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: kcontentTextstyle,),
                      Text(age.toString(), style: knumberTextstyle,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(icon: FontAwesomeIcons.minus,
                          onPress: (){
                            setState(() {
                              age--;
                            });
                          },),
                          RoundButton(icon: FontAwesomeIcons.plus,
                          onPress: (){
                            setState(() {
                              age++;
                            });
                          },),
                        ],
                      ),
                    ],
                  ),
                  colour: kactiveCardcolor),),
              ],
            ),
          ),
          BottomButton(
          onTap: (){
          CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
            bmiResult: calc.calculateBmi(),
            interpretationText: calc.getInterpretation(),
            resultText: calc.getResult(),
          ),
          ),
          );
        },
          titletext: 'CALCULATE',

          ),
        ],
      )
    );
  }
}





class RoundButton extends StatelessWidget {
  RoundButton({this.icon, this.onPress});

  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 42.0,
        height: 42.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}