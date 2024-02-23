
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
      'city_id': city,
      'message': message,
      'access_token': token
      // 'img_url': ''
    };
  }

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
      token: map['access_token']
    );
  }

  factory UserModel.zero() => UserModel(
      name: "",
      email: "",
      password: "",
      phone: "",
      city: 1,
      image: "",
      message: "",
      token: ""
      );
}
