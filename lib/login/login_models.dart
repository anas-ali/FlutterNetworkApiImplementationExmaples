class LoginRequest {
  final String email;
  final String password;

  LoginRequest({this.email, this.password});

  Map<String, dynamic> toJson() => <String, dynamic>{
    'email': this.email,
    'password': this.password,
  };
}

class LoginResponse {
  String token;
  LoginResponse({this.token});
  LoginResponse.fromJson(Map<String, dynamic> json) : token = json['token'];
}