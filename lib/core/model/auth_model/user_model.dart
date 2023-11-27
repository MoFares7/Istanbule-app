// ignore_for_file: non_constant_identifier_names

class User {
  int id;
  String name;
  String email;
  String? dateJoin;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.dateJoin,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': dateJoin,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        dateJoin: json["email_verified_at"],
      );
  factory User.zero() => User(id: 0, name: "", email: "", dateJoin: "");
}
