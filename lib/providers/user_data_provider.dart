import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:constatel/models/user.dart';
import 'package:constatel/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataProvider with ChangeNotifier {
  String? name;
  String? phoneNumber;
  List<Car> cars = [];

  // ... other methods

  void addCar(Car car) {
    cars.add(car);
    notifyListeners();
  }

  void updateCar(int index, Car car) {
    cars[index] = car;
    notifyListeners();
  }

  void removeCar(int index) {
    cars.removeAt(index);
    notifyListeners();
  }
}