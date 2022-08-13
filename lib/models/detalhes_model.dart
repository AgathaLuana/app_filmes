class DetalhesModel {
  String? backdropPath;
  int? id;
  String? overview;
  String? title;

  DetalhesModel({
    this.backdropPath,
    this.id,
    this.overview,
    this.title,
  });

  DetalhesModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    overview = json['overview'];
    title = json['title'];
  }
}
