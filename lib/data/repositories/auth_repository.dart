import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:movies_app/domain/exeptions/exceptions.dart';
import 'package:movies_app/domain/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/domain/models/register_model.dart';
import 'package:movies_app/domain/token.dart';

class AuthRepository {
  static const localUrl = "localhost:44342";
  static const baseUrl = "fluttermoviesapi.azurewebsites.net";
  static var log = Logger();

  static Future<void> login(LoginModel model) async {
    try {
      final response = await http.post(
        Uri.https(baseUrl, "/SignIn"),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 401) {
        throw Unauthorized();
      }
      final result = jsonDecode(response.body)["token"];
      Token.saveToken(result);
      log.i(result);
    } on Unauthorized {
      throw Unauthorized(message: "Credenziali errate!");
    } catch (e) {
      throw GenericError(message: "Qualcosa è andato storto!");
    }
  }

  static Future<void> register(RegisterModel model) async {
    try {
      final response = await http.post(
        Uri.https(baseUrl, "/SignUp"),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 400) {
        throw AlreadyExist();
      }
    } on AlreadyExist {
      throw AlreadyExist(message: "Questo account esiste già!");
    } catch (e) {
      throw GenericError(message: "Qualcosa è andato storto!");
    }
  }

  static Future<void> registerWithLogin(RegisterModel model) async {
    final LoginModel loginModel = LoginModel(
      username: model.username,
      password: model.password,
    );
    Future.wait([
      register(model),
      Future.delayed(const Duration(seconds: 3), () => login(loginModel)),
    ]);
  }

  static void logout(BuildContext context) {
    Token.removeToken();
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
