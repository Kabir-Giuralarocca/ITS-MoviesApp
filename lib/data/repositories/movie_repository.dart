import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movies_app/domain/exeptions/exceptions.dart';
import 'package:movies_app/domain/models/movie_model.dart';
import 'package:movies_app/domain/token.dart';

class MovieRepository {
  static const localUrl = "localhost:44342";
  static const baseUrl = "fluttermoviesapi.azurewebsites.net";

  static Future<List<Movie>> movies() async {
    try {
      var token = "";
      await Token.getToken().then((value) => token = value);
      final response = await http.get(
        Uri.https(baseUrl, "api/Movies"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      if (response.statusCode == 401) {
        throw Unauthorized();
      }
      Iterable data = jsonDecode(response.body);
      final result = data.map((e) => Movie.fromJson(e)).toList();
      result.shuffle();
      return result;
    } on Unauthorized {
      throw Unauthorized(message: "Credenziali errate!");
    } catch (e) {
      throw GenericError(message: "Qualcosa è andato storto!");
    }
  }
}
