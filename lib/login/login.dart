import 'package:flutter/material.dart';
import 'package:networktest/login/login_service.dart';
import 'package:networktest/movielist/movies_widget.dart';
import 'package:toast/toast.dart';

import 'login_models.dart';

class LoginWidget extends StatelessWidget {
  BuildContext context;

  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void handleResponse(LoginResponse loginResponse) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MoviesWidget()),
    );
  }

  void handleError(Exception message) {
    Toast.show(message.toString(), context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  void performLogin() {
    FocusScope.of(context).unfocus();
    var loginRequest = LoginRequest(
        email: emailController.text, password: passwordController.text);

    LoginAPIService.requestLogin(loginRequest)
        .then(handleResponse)
        .catchError((error) => handleError(error));
  }

  @override
  Widget build(BuildContext context) {
    //emailController.text = "eve.holt@reqres.in";
    //passwordController.text = "cityslicka";

    this.context = context;

    //Email Field
    final emailField = TextField(
        controller: emailController,
        style: style,
        decoration: InputDecoration(
            hintText: "Email"));

    //Password Field
    final passwordField = TextField(
      controller: passwordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          hintText: "Password"),
    );

    //Login Button
    final loginButon = MaterialButton(
        color: Colors.lightBlue[600],
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: performLogin,
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),

    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                emailField,
                passwordField,
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: loginButon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
