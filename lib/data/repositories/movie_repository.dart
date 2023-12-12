import 'package:dio/dio.dart';
import 'package:movies_app/data/client/movie_client.dart';
import 'package:movies_app/domain/models/movie_model.dart';

class MovieRepository {
  static Future<List<Movie>> movies() async {
    try {
      // var token = "";
      // await Token.getToken().then((value) => token = value);
      // final response = await http.get(
      //   Uri.https(baseUrl, "api/Movies"),
      //   headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      // );
      // if (response.statusCode == 401) {
      //   throw Unauthorized();
      // }
      // Iterable data = jsonDecode(response.body);
      final response = await MovieClient.dio.get("");
      Iterable data = response.data;
      final result = data.map((e) => Movie.fromJson(e)).toList();
      result.shuffle();
      return result;
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }
}
