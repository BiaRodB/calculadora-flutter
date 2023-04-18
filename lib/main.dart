import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import './widgets/CalcButton.dart';
// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';


const Color darkBlue = Color.fromARGB(240, 51, 159, 231);

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ); // MaterialApp
  }
}

  
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';
  
  // Array of button
  final List<String> buttons = [
    'AC',
    '+/-',
    '%',
    'C',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'X',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Olá! Beatriz"),
      Icon(Icons.calculate,size: 30,),
      
    ],
  ),
      ), //AppBar
      backgroundColor: const Color.fromARGB(255, 247, 245, 250),
      body: Column(
        children: <Widget>[
          Expanded(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(26),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: const TextStyle(fontSize: 28, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: const TextStyle(
                            fontSize: 35,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 0) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.cyan,
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                      );
                    }
  
                    // +/- button
                    else if (index == 1) {
                      return MyButton(
                        buttonText: buttons[index],
                          color: Colors.cyan,
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                      );
                    }
                    // % Button
                    else if (index == 2) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.cyan,
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                      );
                    }
                    // Delete Button
                    else if (index == 3) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                          color: Colors.cyan,
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                      );
                    }
                    // Equal_to Button
                    else if (index == 18) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.white,
                      );
                    }
  
                    //  other buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.blue
                            : Colors.grey,
                        textColor: isOperator(buttons[index])
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 255, 255, 255),
                      );
                    }
                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }
  
  bool isOperator(String x) {
    if (x == '/' || x == 'X' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
  
// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('X', '*');
  
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}




