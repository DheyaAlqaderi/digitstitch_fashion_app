class SignupResponseModel {
  String token;

  SignupResponseModel({
    required this.token,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      token: json['token'],
    );
  }
}
