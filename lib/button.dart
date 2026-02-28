import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  String text;
  Color ? colorx;
  final VoidCallback onClick;
  Button({
    super.key,
    required this.onClick,
    this. colorx,
    required this.text,


  });

  @override
  Widget build(BuildContext context) {
    return
      Expanded(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: colorx ?? Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
            onPressed: onClick, child: Text(text,style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),)),
            ),
      );
  }
}
