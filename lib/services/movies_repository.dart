import 'dart:convert';
import 'dart:developer';

import 'package:appfilmes/models/filme_model.dart';
import 'package:appfilmes/models/filme_response_model.dart';
import 'package:appfilmes/models/detalhes_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../core/tmdb_constants.dart';

class MoviesRepository {
  //Filmes Populares
  static Future<List<FilmeModel>?> getFilmesPopulares() async {
    final String url = TmdbConstants.getMovieUrl("popular");
    return _getListFilmes(url);
  }

  //Mais Avaliados
  static Future<List<FilmeModel>?> getMaisAvaliados() async {
    final String url = TmdbConstants.getMovieUrl("top_rated");
    return _getListFilmes(url);
  }

    static Future<List<FilmeModel>?> _getListFilmes(String url) async {
    try {
      Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        FilmeResponseModel filmesResponse =
            FilmeResponseModel.fromJson(response.body);
        return filmesResponse.movies;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
// Detalhes 
// ? significa q pode ser nulo
  static Future<DetalhesModel?> getDetalhes(int movieId) async {
    final String url = TmdbConstants.getMovieUrl(movieId.toString());

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        DetalhesModel detalhesModel =
            DetalhesModel.fromJson(json.decode(response.body));
        return detalhesModel;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
