import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double widthNumber;

  RoundedButton({required this.text, required this.onPressed, required this.widthNumber, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthNumber,
     child:  ElevatedButton(
       onPressed: onPressed,
       style: ElevatedButton.styleFrom(
         //primary: color ?? Colors.black87, // Use provided color or default to black87
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(40.0),
         ),
       ),
       child: Padding(
         padding: const EdgeInsets.symmetric(vertical: 25.0),
         child: Text(
           text,
           textAlign: TextAlign.center,
           style: TextStyle(
             fontWeight: FontWeight.bold,
             color: textColor ?? Colors.white, // Use provided textColor or default to white
             fontSize: 18.0,
           ),
         ),
       ),
     ),
    );
  }
}
