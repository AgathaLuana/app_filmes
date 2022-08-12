import 'dart:convert';

class FilmeModel {
  int? id;
  String? posterPath;
  String title;

  FilmeModel({
    this.id,
    this.posterPath,
    required this.title,
  });

  factory FilmeModel.fromMap(Map<String, dynamic> json) => FilmeModel(
        id: json["id"],
        posterPath: json["poster_path"],
        title: json["title"] ?? "",
      );

  factory FilmeModel.fromJson(String str) =>
      FilmeModel.fromMap(json.decode(str));
}
