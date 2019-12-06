import 'dart:math';


class CalculatorBrain{

 CalculatorBrain({this.height, this.weight});
 final int height;
 final int weight;

 double _bmi;
 
 String calculateBmi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);

 }
 String getResult(){
   if(_bmi >=25)
   {
     return 'Overweight';
   }
   else if( _bmi >18.5)
   {
     return 'Normal';
   }
   else{
     return 'Underweight';
   }
 }


 String getInterpretation(){
   if(_bmi >=25)
   {
     return 'You have a more than normal body weight. Try to exercise!';
   }
   else if( _bmi >18.5)
   {
     return 'You have a normal body weight. Good Job!';
   }
   else{
    return 'Your BMI result is quite low ! You should eat more.';
   }
 }

}