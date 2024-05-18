class Car {
  final String? id;// Use String? for nullable ID, which will be assigned by Firestore.
  String ownerName;
  String ownerPhoneNumber;
  String licensePlate;
  String model;
  String brand;
  String userWhoReportId;
  String description;

  Car({
    this.id,
    required this.ownerName,
    required this.ownerPhoneNumber,
    required this.licensePlate,
    required this.model,
    required this.brand,
    required this.userWhoReportId,
    required this.description
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      ownerName: json['ownerName'],
      ownerPhoneNumber: json['ownerPhoneNumber'],
      licensePlate: json['licensePlate'],
      model: json['model'],
      brand: json['brand'],
      userWhoReportId: json['userWhoReportId'],
      description: json['description']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerName': ownerName,
      'ownerPhoneNumber': ownerPhoneNumber,
      'licensePlate': licensePlate,
      'model': model,
      'brand': brand,
      'userWhoReportId': userWhoReportId,
      'description': description
    };
  }
}
