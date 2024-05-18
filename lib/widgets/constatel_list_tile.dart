import 'package:flutter/material.dart';
import 'package:constatel/widgets/constatel_text.dart';

class ConstatelListTile extends StatefulWidget {

  final String title;
  final String subtitle;
  final IconData iconData;

  const ConstatelListTile({Key? key, required this.title, required this.subtitle, required this.iconData}) : super(key: key);

  @override
  State<ConstatelListTile> createState() => _ConstatelListTileState();
}

class _ConstatelListTileState extends State<ConstatelListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(
          widget.iconData,
          color: Colors.white,
          size: 30.0,
        ),
      title: ConstatelText(title: widget.title, color: Colors.white, fontWeight: FontWeight.bold,),
      subtitle: ConstatelText(title: widget.subtitle , color: Colors.white,),
    );
  }
}
