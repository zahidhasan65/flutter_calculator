import 'package:flutter/material.dart';
import 'button.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String output = '0';
  String input = '0';
  String operator = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPress(String value) {
    setState(() {

      if (value == 'C') {
        output = '0';
        input = '0';
        operator = '';
        num1 = 0;
        num2 = 0;
      }
      else if (value == 'B') {
        if (input.length > 1) {
          input = input.substring(0, input.length - 1);
        } else {
          input = '0';
        }
        output = input;
      }

      else if (['+','-','*','/','%'].contains(value)) {
        num1 = double.parse(input);
        operator = value;
        input = '0';
      }

      else if (value == '=') {
        num2 = double.parse(input);

        if (operator == '+') {
          output = (num1 + num2).toString();
        }
        else if (operator == '-') {
          output = (num1 - num2).toString();
        }
        else if (operator == '*') {
          output = (num1 * num2).toString();
        }
        else if (operator == '%') {
          output = ((num1 / num2)*100).toString();
        }
        else if (operator == '/') {
          output = num2 != 0
              ? (num1 / num2).toString()
              : 'Error';
        }

        input = output;
        operator = '';

      }

      else {
        if (input == '0') {
          input = value;
        } else {
          input += value;
        }
        output = input;

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Calculator",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontSize: 25
        ),),
      backgroundColor: Colors.black26,
        centerTitle: true,
      ),
      body: Column(
        children: [

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$num1 $operator $num2",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    output,
                    style:  TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),


          Row(
            children: [
              Button(text: 'C', onClick: () => buttonPress('C'), colorx: Colors.orange),
              Button(text: 'B', onClick: () => buttonPress('B'), colorx: Colors.orange),
              Button(text: '%', onClick: () => buttonPress('%'), colorx: Colors.blue),
              Button(text: '/', onClick: () => buttonPress('/'), colorx: Colors.blue),
            ],
          ),
          Row(
            children: [
              Button(text: '7', onClick: () => buttonPress('7')),
              Button(text: '8', onClick: () => buttonPress('8')),
              Button(text: '9', onClick: () => buttonPress('9')),
              Button(text: '*', onClick: () => buttonPress('*'), colorx: Colors.blue),
            ],
          ),
          Row(
            children: [
              Button(text: '4', onClick: () => buttonPress('4')),
              Button(text: '5', onClick: () => buttonPress('5')),
              Button(text: '6', onClick: () => buttonPress('6')),
              Button(text: '-', onClick: () => buttonPress('-'), colorx: Colors.blue),
            ],
          ),
          Row(
            children: [
              Button(text: '1', onClick: () => buttonPress('1')),
              Button(text: '2', onClick: () => buttonPress('2')),
              Button(text: '3', onClick: () => buttonPress('3')),
              Button(text: '+', onClick: () => buttonPress('+'), colorx: Colors.blue),
            ],
          ),
          Row(
            children: [
              Container(
                  width: 103,
                  child: Button(text: '0', onClick: () => buttonPress('0'))),
              Container(
                  width: 103,
                  child: Button(text: '.', onClick: () => buttonPress('.'))),
              Button(text: '=', onClick: () => buttonPress('='), colorx: Colors.green),],
          ),
        ],
      ),
    );
  }
}