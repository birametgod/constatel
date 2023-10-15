class Accident {
  final String id;
  final String userId; // The id of the user who reported the accident
  final DateTime dateTime;
  final String location;
  final String description;
  final List<String> photos;

  Accident({
    required this.id,
    required this.userId,
    required this.dateTime,
    required this.location,
    required this.description,
    required this.photos,
  });

  factory Accident.fromJson(Map<String, dynamic> json) {
    return Accident(
      id: json['id'],
      userId: json['userId'],
      dateTime: DateTime.parse(json['dateTime']),
      location: json['location'],
      description: json['description'],
      photos: List<String>.from(json['photos']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'dateTime': dateTime.toIso8601String(),
      'location': location,
      'description': description,
      'photos': photos,
    };
  }
}
