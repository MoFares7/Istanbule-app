class VerifyCodeModel {
  String email;
  String code;

  VerifyCodeModel({required this.email, required this.code});

  factory VerifyCodeModel.zero() => VerifyCodeModel(email: "", code: "");

  Map<String, dynamic> toJson() => {
        'email': email,
        'verify': code,
      };
}
