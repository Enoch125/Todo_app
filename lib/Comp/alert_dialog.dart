import 'package:flutter/material.dart';
import 'package:todo_app/Comp/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key,required this.controller, required this.onSave, required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 150,
      
        
        
        child: Column(children: [
          TextField(
            keyboardType: TextInputType.text,
            controller: controller,
            decoration:const InputDecoration(
              
                border: OutlineInputBorder(), 
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(
                //     color: Colors.blue,
                //     width: 2.3,
                //     style: BorderStyle.solid,
                //     strokeAlign: BorderSide.strokeAlignInside,
                  
                //   )
                // ),
                
          
                hintText:"Add Task" ,
                hintStyle: TextStyle(color: Colors.redAccent)),
          ),
              const SizedBox(height: 20),
              
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(text: "Save", onpressed: onSave),
              const SizedBox(width: 5),
              MyButton(text: "Cancel", onpressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
