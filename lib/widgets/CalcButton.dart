// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
  
// creating Stateless Wideget for buttons
class MyButton extends StatelessWidget {
    
  // declaring variables 
  // ignore: prefer_typing_uninitialized_variables
  final color;
  // ignore: prefer_typing_uninitialized_variables
  final textColor;
  final String buttonText;
  // ignore: prefer_typing_uninitialized_variables
  final buttontapped;
  
  //Constructor
  // ignore: prefer_const_constructors_in_immutables
  MyButton({super.key, this.color, this.textColor, required this.buttonText, this.buttontapped});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
            color: color,),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}