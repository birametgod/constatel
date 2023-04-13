import 'package:flutter/material.dart';
import 'package:constatel/app_colors.dart';
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
      leading: Material(
        shape: const CircleBorder(
            side: BorderSide(
                width: 3.0, color: Color(0xFFD2D1D1))),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        elevation: 4.0,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            widget.iconData,
            color: AppColors.constatel.blue,
          ),
        ),
      ),
      title: ConstatelText(title: widget.title),
      subtitle: ConstatelText(title: widget.subtitle),
    );
  }
}
