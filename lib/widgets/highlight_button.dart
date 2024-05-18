import 'package:flutter/material.dart';
import 'package:constatel/widgets/constatel_text.dart';

class HighLightButton extends StatefulWidget {
  final String title;
  final Color color;
  final bool isHighLighted;

  const HighLightButton({Key? key, required this.title, required this.color, required this.isHighLighted}) : super(key: key);

  @override
  State<HighLightButton> createState() => _HighLightButtonState();
}

class _HighLightButtonState extends State<HighLightButton> {


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: widget.isHighLighted ? Colors.transparent : widget.color,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color:  widget.isHighLighted ? Colors.transparent : widget.color, width: 2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        child: ConstatelText(
          title: widget.title,
          color: widget.isHighLighted ? Colors.grey :Colors.white ,
          fontWeight: FontWeight.w500,
          textAlign:  TextAlign.center,
        )
      );
  }
}
