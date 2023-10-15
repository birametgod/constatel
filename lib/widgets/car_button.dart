import 'package:flutter/material.dart';
import 'package:constatel/widgets/constatel_text.dart';
import 'package:constatel/app_colors.dart';
import 'package:constatel/models/car.dart';

class CarButton extends StatelessWidget {
  final int carNumber;
  final Car car;
  final VoidCallback onCarButtonTap;
  final bool isSelected;
  final String ownerName;

  const CarButton(
      {Key? key,
      required this.ownerName, // Add ownerName parameter
      required this.carNumber,
      required this.car,
      required this.onCarButtonTap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onCarButtonTap,
      style: isSelected
          ? ElevatedButton.styleFrom(
              backgroundColor: AppColors.constatel.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)))
          : ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
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
                    color: isSelected ? Colors.white24 : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Icon(
                  Icons.drive_eta_outlined,
                  color: isSelected ? Colors.white : AppColors.constatel.blue,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ConstatelText(
                  title: "${ownerName}",
                  size: 12.0,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.grey.shade500),
            ],
          )),
    );
  }
}
