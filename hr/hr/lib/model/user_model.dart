import 'dart:convert';

class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? userId;
  String? phoneNumber;
  bool? admin;

  UserModel({
    this.firstName,
    this.lastName,
    this.userId,
    this.email,
    this.phoneNumber,
    this.admin,
  });

  // Create a UserModel from Firestore document data
  UserModel.fromFirestore(Map<String, dynamic> data)
      : firstName = data['firstName'] as String?,
        lastName = data['lastName'] as String?,
        userId = data['userId'] as String?,
        email = data['email'] as String?,
        admin = data['admin'] as bool?,
        phoneNumber = data['phoneNumber'] as String?;

  // Convert UserModel to JSON for debugging or other purposes
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userId': userId,
      'email': email,
      'admin': admin,
      'phoneNumber': phoneNumber,
    };
  }

  // Convert UserModel to JSON string
  String toJson() => jsonEncode(toMap());

  // Create a UserModel from JSON string
  factory UserModel.fromJson(String jsonStr) {
    final Map<String, dynamic> data = jsonDecode(jsonStr);
    return UserModel.fromFirestore(data);
  }
}
