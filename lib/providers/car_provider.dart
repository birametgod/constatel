import 'package:flutter/foundation.dart';
import 'package:constatel/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CarProvider with ChangeNotifier {
  final CollectionReference carsCollection =
  FirebaseFirestore.instance.collection('cars');
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> addCar(Car car) async {
    try {
      await carsCollection.add(car.toJson());
      notifyListeners();
    } catch (e) {
      // Handle errors here
      print('Error adding car: $e');
    }
  }

  Future<List<Car>> getCarsForUser(String userId) async {
    print(userId);
    QuerySnapshot querySnapshot = await carsCollection
        .where('userWhoReportId', isEqualTo: userId)
        .get();

    List<Car> cars = [];
    querySnapshot.docs.forEach((doc) {
      final carData = doc.data() as Map<String, dynamic>? ?? {};
      if (carData.isNotEmpty) {
        cars.add(Car.fromJson(carData));
      }
    });

    if (cars.isEmpty) {
      print('No cars found for the given user.');
    }

    return cars;
  }

  Future<Car?> getCarForUser(String userId) async {
    print(userId);
    QuerySnapshot querySnapshot = await carsCollection
        .where('userWhoReportId', isEqualTo: userId)
        .limit(1) // Limit the query to retrieve only one document
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final carData = querySnapshot.docs.first.data() as Map<String, dynamic>;
      return Car.fromJson(carData);
    } else {
      print('No car found for the given user.');
      return null;
    }
  }


  Future<void> updateCar(Car car) async {
    try {
      // Query the collection to find the car with a matching license plate
      final QuerySnapshot snapshot = await carsCollection
          .where('userWhoReportId', isEqualTo:  car.userWhoReportId)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final carId = snapshot.docs.first.id; // Get the carId of the first matching document
        await carsCollection.doc(carId).update(car.toJson());
      } else {
        print('Car with the given license plate not found.');
      }
    } catch (e) {
      // Handle errors here
      print('Error updating car: $e');
    }
  }
}
