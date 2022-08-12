import 'dart:developer';

import 'package:appfilmes/models/filme_model.dart';
import 'package:appfilmes/models/filme_response_model.dart';
import 'package:http/http.dart' as http;

class MoviesRepository {
  static Future<List<FilmeModel>?> getFilmesPopulares() async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=040227474a13434a2e8118064c72b4ef'));

      if (response.statusCode == 200) {
        var filmesResponse = FilmeResponseModel.fromJson(response.body);
        return filmesResponse.movies;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
