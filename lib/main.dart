import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'newFile.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  String pressedButton = '';
  String solution = '';
  double solution1;
  var operand = '';
  double firstValue;
  double secondValue;
  double tempValue;
  Color operandColor = Colors.white70;
  Color pressedButtonColor = Colors.blueGrey;

  Color minusColor = Colors.white70;
  Color minusButtonColor = Colors.blueGrey;
  Color multiplyColor,plusColor, divideColor;
  Color plusButtonColor, multiplyButtonColor, divideButtonColor;


  List<String> ListOfOperands = ['+', '-', 'x', '÷'];
  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

    updateNumber(String i) {
      setState(() {
        pressedButton += i;
      });
    }

  //to find the percentage
  percentFunction() {
    setState(() {
      pressedButton = (double.parse(pressedButton) / 100).toString();
    });
  }

  bool newCheck;
  var element1;
  //change the sign to positive or negative
  signFunction() {
    print(pressedButton.split('+')[1]);
    ListOfOperands.forEach((element) {
      if(pressedButton.contains(element)){
         newCheck = true;
      }
    });
    if (pressedButton != '') {
      if (pressedButton[0] != '-' && newCheck == false) {
        print('first Condition');
        setState(() {
          pressedButton = '-$pressedButton';
        });
      } else if (pressedButton[0] == '-' && newCheck == false) {
        print("Second Condition");
        setState(() {
          pressedButton = pressedButton.replaceAll(r'-', '');
        });
      }
      else if(newCheck == true) {
        print("Third Condition");
        ListOfOperands.forEach((element) {
          if(pressedButton.contains('$element')){
             element1 = element;
          }
        });
        setState(() {
          pressedButton = pressedButton.replaceFirst(pressedButton.split('$element1')[1], "(-${pressedButton.split('$element1')[1]})");
        });
        print(pressedButton);
      }

    }
  }
/*
* Idea: let the pressedButton be full then split it to fit first and second value. Split if operand not equal to the first value
*
* Problems: decimal formatting Issue. sign on secondValue
*
* */

  solutionContinue(){
   if(solution != ''){
     setState(() {
       pressedButton = solution;
     });
   }{
     firstValue = double.parse(pressedButton);
   }
  }

solutionFormatting(){
    if(double.parse(solution.split('.')[1]) == 0){
      format(double.parse(solution));
    }else if(double.parse(solution.split('.')[1]) > 7){
      solution = double.parse(solution).toStringAsFixed(7);
      print('ii '+ solution);
    }
    else{

    }
}

    //Logic for calculator
    operationFunction() {
      if (pressedButton != '') {
        switch (operand) {
          case '+':
            {
              setState(() {
                secondValue = double.parse(pressedButton.split('+')[1]);
                //solution = (format(firstValue + secondValue)).toString();
                //solutionFormatting();
                solution = (firstValue + secondValue).toString();
              });
            }
            break;

          case '-':
            {
              setState(() {
                secondValue = double.parse(pressedButton.split('-')[1]);
                solution = (format(firstValue - secondValue)).toString();
                solutionFormatting();
              });
            }
            break;

          case 'x':
            {
              setState(() {
                secondValue = double.parse(pressedButton.split('x')[1]);
                solution = (format(firstValue * secondValue)).toString();
                solutionFormatting();
              });
            }
            break;

          case '÷':
            {
              setState(() {
                secondValue = double.parse(pressedButton.split('÷')[1]);
                solution = (format(firstValue / secondValue)).toString();
                solutionFormatting();
              });
              break;
            }
        }
      }
      else{

      }
    }


    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '$pressedButton',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 30.0,
                        decoration: TextDecoration.none
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    solution,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                    ),
                  ),
                ),

                Row(
                    children: [
                      CalcButton(buttonText: 'C',
                        buttonColor: Colors.white12,
                        textColor: Colors.white70,
                        onPressed: () {
                          setState(() {
                            pressedButton = '';
                            solution = '';
                          });
                        },),
                      CalcButton(buttonText: '+/-',
                          buttonColor: Colors.white12,
                          textColor: Colors.white70,
                          onPressed: () {
                            signFunction();
                          }),
                      CalcButton(buttonText: '%',
                        buttonColor: Colors.white12,
                        textColor: Colors.white70,
                        onPressed: () {
                          percentFunction();
                        },),
                      CalcButton(buttonText: '÷',
                        buttonColor: pressedButtonColor,
                        textColor: operandColor,
                        onPressed: () {
                          operand = '÷';
                          solutionContinue();
                          updateNumber('÷');
                        },
                      ),
                    ]
                ),

                Row(
                  children: [
                    CalcButton(buttonText: '7',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('7');
                        MethodHolder.testFunction();
                      },),
                    CalcButton(buttonText: '8',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('8');
                      },),
                    CalcButton(buttonText: '9',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('9');
                      },),
                    CalcButton(buttonText: 'x',
                      buttonColor: pressedButtonColor,
                      textColor: operandColor,
                      onPressed: () {
                        operand = 'x';
                       solutionContinue();
                        updateNumber('x');
                      },
                    ),
                  ],
                ),

                Row(
                  children: [
                    CalcButton(buttonText: '4',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('4');

                      },),
                    CalcButton(buttonText: '5',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('5');
                      },),
                    CalcButton(buttonText: '6',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('6');
                      },),
                    CalcButton(buttonText: '-',
                      buttonColor: minusButtonColor,
                      textColor: minusColor,
                      onPressed: () {
                        operand = '-';
                        solutionContinue();
                        updateNumber('-');
                      },
                    ),
                  ],
                ),

                Row(
                  children: [
                    CalcButton(buttonText: '1',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('1');
                      },),
                    CalcButton(buttonText: '2',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('2');
                      },),
                    CalcButton(buttonText: '3',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('3');
                      },),
                    CalcButton(buttonText: '+',
                      buttonColor: pressedButtonColor,
                      textColor: operandColor,
                      onPressed: () {
                        operand = '+';
                        solutionContinue();
                        updateNumber('+');
                      },
                    ),
                  ],
                ),

                Row(
                  children: [
                    CalcButton(buttonText: '0',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('0');
                      },),
                    CalcButton(buttonText: '.',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        updateNumber('.');
                      },),
                    CalcButton(buttonText: 'DEL',
                      buttonColor: Colors.white12,
                      textColor: Colors.white70,
                      onPressed: () {
                        setState(() {
                          pressedButton = pressedButton.substring(0, pressedButton.length - 1);
                        });
                      },
                    ),
                    CalcButton(buttonText: '=',
                      buttonColor: pressedButtonColor,
                      textColor: operandColor,
                      onPressed: () {
                        operationFunction();
                        print(format(double.parse(solution)));

                      },
                    ),
                  ],
                ),
              ]
          ),
        ),
      );
    }
  }



