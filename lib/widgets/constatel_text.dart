import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstatelText extends StatefulWidget {
  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  final TextAlign? textAlign;
  const ConstatelText(
      {Key? key,
      required this.title,
      this.color,
      this.fontWeight,
      this.size,
      this.textAlign})
      : super(key: key);

  @override
  State<ConstatelText> createState() => _ConstatelTextState();
}

class _ConstatelTextState extends State<ConstatelText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.textAlign,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: widget.color,
              fontWeight: widget.fontWeight,
              fontSize: widget.size)),
    );
  }
}
