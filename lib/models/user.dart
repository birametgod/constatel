class UserModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String? email;
  final String? address;

  UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.address,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address : json['address']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address
    };
  }
}
