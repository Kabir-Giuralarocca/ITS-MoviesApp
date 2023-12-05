import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:movies_app/data/client/auth_client.dart';
import 'package:movies_app/domain/models/login_model.dart';
import 'package:movies_app/domain/models/register_model.dart';
import 'package:movies_app/domain/token.dart';

class AuthRepository {
  static var log = Logger();

  static Future<void> login(LoginModel model) async {
    try {
      // final response = await http.post(
      //   Uri.https(baseUrl, "/SignIn"),
      //   headers: {"Content-Type": "application/json; charset=UTF-8"},
      //   body: jsonEncode(model.toJson()),
      // );
      // if (response.statusCode == 401) {
      //   throw Unauthorized();
      // }
      final response = await AuthClient.dio.post(
        "/SignIn",
        data: jsonEncode(model.toJson()),
      );
      final result = response.data["token"];
      Token.saveToken(result);
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<void> register(RegisterModel model) async {
    try {
      // final response = await http.post(
      //   Uri.https(baseUrl, "/SignUp"),
      //   headers: {"Content-Type": "application/json; charset=UTF-8"},
      //   body: jsonEncode(model.toJson()),
      // );
      // if (response.statusCode == 400) {
      //   throw AlreadyExist();
      // }
      await AuthClient.dio.post(
        "/SignUp",
        data: jsonEncode(model.toJson()),
      );
    } on DioException catch (e) {
      throw e.error as Object;
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
