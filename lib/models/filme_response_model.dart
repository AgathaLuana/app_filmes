import 'dart:convert';

import 'package:appfilmes/models/filme_model.dart';

class FilmeResponseModel {
  final List<FilmeModel> movies;

  FilmeResponseModel({
    required this.movies,
  });

  factory FilmeResponseModel.fromJson(String str) =>
      FilmeResponseModel.fromMap(json.decode(str));

  factory FilmeResponseModel.fromMap(Map<String, dynamic> json) =>
      FilmeResponseModel(
        movies: List<FilmeModel>.from(
            json["results"].map((movie) => FilmeModel.fromMap(movie))),
      );
}
