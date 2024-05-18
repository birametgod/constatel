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
              backgroundColor:  Colors.white.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
      child: Container(
          padding: EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstatelText(
                  title: "${ownerName}",
                  size: 12.0,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.grey.shade500),
              SizedBox(height: 20.0,),
              Icon(
                  Icons.car_crash_sharp,
                  color: isSelected ? Colors.white : AppColors.constatel.blue,
                size: 40,
                ),
            ],
          )),
    );
  }
}
