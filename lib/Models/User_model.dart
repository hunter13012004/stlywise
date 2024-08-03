import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? FirstName;
  String? LastName;
  String? Email;

  UserModel(
      {required this.FirstName, required this.LastName, required this.Email});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
        FirstName: data['FirstName'] ?? '',
        LastName: data['LastName'] ?? '',
        Email: data['Email'] ?? '');
  }
}
