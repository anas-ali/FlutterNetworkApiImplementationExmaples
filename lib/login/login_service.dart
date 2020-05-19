import 'dart:convert';
import 'package:http/http.dart' as http;
import 'login_models.dart';

class LoginAPIService {
  static Future<LoginResponse> requestLogin(LoginRequest request) async {
    //https://codingwithjoe.com/dart-fundamentals-async-await/ follow thie link for clear understanding of async and await
    final http.Response response = await http.post(
      'https://reqres.in/api/login',
      body: request.toJson(),
    );
    var map = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(map);
    } else {
      if (map.containsKey('error')) {
        throw Exception(map['error']);
      } else {
        throw Exception('Invalid Response From Server');
      }
    }
  }
}


/*
 User Name Password
{
"email": "eve.holt@reqres.in",
"password": "cityslicka"
}*/
