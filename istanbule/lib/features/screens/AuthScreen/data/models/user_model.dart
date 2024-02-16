import 'package:flutter/foundation.dart';
import 'package:istanbule/features/screens/AuthScreen/domain/entity/user.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? token;
  int? city;
  String? image;
  String? message;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.token,
      this.city,
      this.image,
      this.message});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone_no': phone,
      'city_id': 1,
      'message': message
      // 'img_url': ''
    };
  }

  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //       name: map['name'],
  //       email: map['email'],
  //       password: map['password'],
  //       phone: map['phone_no'],
  //       city: map[1],
  //       image: map['img_url']);
  // }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      phone: map['phone_no'],
      city: map["city_id"],
      image: map['img_url'],
      message: map['message'],
    );
  }

  factory UserModel.zero() => UserModel(
      name: "",
      email: "",
      password: "",
      phone: "",
      city: 1,
      image: "",
      message: "");
}
