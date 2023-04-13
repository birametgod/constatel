import 'package:flutter/material.dart';
import 'package:constatel/widgets/constatel_text.dart';
import 'package:constatel/app_colors.dart';

class CarButton extends StatelessWidget {
  final int carNumber;

  const CarButton({Key? key, required this.carNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.constatel.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0))),
      child: Container(
          padding: EdgeInsets.only(right: 20.0, top: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Icon(
                  Icons.drive_eta_outlined,
                  color: Colors.white70,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ConstatelText(
                  title: "Vehicule ${carNumber}",
                  fontWeight: FontWeight.bold,
                  color: Colors.white70),
            ],
          )),
    );
  }
}
