import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  MyButton({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
   focusColor: Color.fromARGB(60, 60, 70, 70),
   color: Colors.blue,
   textColor: Colors.white,
      child: Text(text,style: 
    const  TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500
      ),),
    );
  }
}
