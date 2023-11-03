import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTitle extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?)? onchangedd;
  Function(BuildContext?)? deleteFunction;
  TodoTitle(
      {super.key,
      required this.taskName,
      required this.taskComplete,
      required this.onchangedd,
      required this.deleteFunction});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 25, 5, 10),
      child: Slidable(
    endActionPane: ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          onPressed: deleteFunction,
     icon: Icons.delete,              backgroundColor: const Color.fromRGBO(201, 85, 85, 0.943),
          borderRadius: BorderRadius.circular(20),
          foregroundColor:Colors.white
        ),
      ],
    ),
    child: Container(
      padding: const EdgeInsets.fromLTRB(
        10,
        15,
        5,
        15,
      ),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            taskName,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                decoration: taskComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          Checkbox(
              value: taskComplete,
              onChanged: onchangedd,
              activeColor: const Color.fromARGB(10, 20, 30, 40)),
        ],
      ),
    ),
      ),
    );
  }
}
