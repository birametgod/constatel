import 'package:flutter/material.dart';
import 'package:constatel/widgets/constatel_text.dart';

class RowWithText extends StatefulWidget {

  final String title;
  final String content;

  const RowWithText({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  State<RowWithText> createState() => _RowWithTextState();
}

class _RowWithTextState extends State<RowWithText> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstatelText(
            title: widget.title,
            color: Colors.blueGrey.shade400,
            fontWeight: FontWeight.bold,
            size: 15.0,
          ),
          ConstatelText(
            title: widget.content,
              fontWeight: FontWeight.w500,
              size: 15.0
          ),
        ]);
  }
}
