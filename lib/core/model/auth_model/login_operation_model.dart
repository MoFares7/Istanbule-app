// ignore_for_file: non_constant_identifier_names

import 'user_model.dart';

class LoginRequestModel {
  String email;
  String password;
  int role_id;

  LoginRequestModel({
    required this.email,
    required this.password,
    required this.role_id,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role_id': 3,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      email: map['email'],
      password: map['password'],
      role_id: map[3],
    );
  }
  factory LoginRequestModel.zero() =>
      LoginRequestModel(email: "", password: "", role_id: 3);
}

//////////////////! Here is Model to Response Login//////////////////////////////

class LoginResponseModel {
  String access_token;
  User? user;

  LoginResponseModel({
    required this.access_token,
    this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'access_token': access_token,
      'user': user,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
        access_token: map['access_token'],
         user: User.fromJson(map["user"]));
  }
  factory LoginResponseModel.zero() => LoginResponseModel(
        access_token: "",
      );
}
