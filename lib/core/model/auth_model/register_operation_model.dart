// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

class RegisterRequestModel {
  String first_name;
  String last_name;
  String email;
  String password;
  String phoneNumber;
  int city;
  RegisterRequestModel({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
      'city_id': 1,
    };
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      first_name: map['first_name'],
      last_name: map['last_name'],
      email: map['email'],
      password: map['password'],
      phoneNumber: map['phone_number'],
      city: map[1],
    );
  }
  factory RegisterRequestModel.zero() => RegisterRequestModel(
      first_name: "",
      last_name: "",
      email: "",
      password: "",
      phoneNumber: "",
      city: 1);
}
