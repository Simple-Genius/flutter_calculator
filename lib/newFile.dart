import 'package:flutter/material.dart';

String pressedButton = '';
String solution = '';
var operand = '';
double firstValue;
Color operandColor = Colors.white70;
Color pressedButtonColor = Colors.blueGrey;

Color plusColor, minusColor, multiplyColor, divideColor;
Color plusButtonColor, minusButtonColor, multiplyButtonColor,
    divideButtonColor;


class MethodHolder extends StatefulWidget{
  static void testFunction(){
    print('1234');
  }


  static void continueAction() {

    if (solution != '') {
      firstValue = double.parse(solution);
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}



class CalcButton extends StatelessWidget {

  const CalcButton({this.buttonText, this.buttonColor, this.textColor, this.onPressed});
  final String buttonText;
  final Color buttonColor;
  final Function onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    //String tappedButton;
    return Expanded(
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),
            ),
          ),
          onPressed: onPressed
      ),
    );
  }
}

// Color plusColor, minusColor, multiplyColor, divideColor;
// Color plusButtonColor, minusButtonColor, multiplyButtonColor, divideButtonColor;

// colorChanger(){
//   if(operand == '+'){
//     plusColor = pressedButtonColor;
//     plusButtonColor =operandColor;
//   }
//   else if(operand == '-'){
//     minusColor = pressedButtonColor;
//     minusButtonColor = operandColor;
//   }
//   else if(operand == 'x'){
//     multiplyColor = pressedButtonColor;
//     multiplyButtonColor = operandColor;
//   }
//   else if(operand == '÷'){
//     divideButtonColor = operandColor;
//     multiplyColor = pressedButtonColor;
//   }
// }
