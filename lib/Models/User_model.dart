class UserModel {
  String? FirstName;
  String? LastName;
  String? Email;
  String? phone;
  String? gender;
  String? age;
  List<String>? Address;

  UserModel(
      {required this.FirstName,
      required this.LastName,
      this.Email,
      this.age,
      this.phone,
      this.gender,
      this.Address});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      FirstName: data['FirstName'] ?? '',
      LastName: data['LastName'] ?? '',
      Email: data['Email'] ?? '',
      age: data['age'] ?? '',
      phone: data['phone'] ?? '',
      gender: data['gender'] ?? '',
      Address: data['address'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': FirstName,
      'lastName': LastName,
      'email': Email,
      'age': age,
      'phone': phone,
      'gender': gender,
      'Address': Address
    };
  }
}
