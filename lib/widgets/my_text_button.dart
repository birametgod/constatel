import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final Color backgroundColor;

  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onTap,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          //primary: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0))),
      onPressed: onTap,
      child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                buttonName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }
}
