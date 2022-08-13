class TmdbConstants {
  static const kBaseUrl = 'https://api.themoviedb.org/3';
  static const String imageBase = 'https://image.tmdb.org/t/p/w500/';
  static const String apiKey = "040227474a13434a2e8118064c72b4ef";

  static String getMovieUrl(String url) {
    //$ faz reconhecer que é um atributo
    return "${TmdbConstants.kBaseUrl}/movie/$url?api_key=${TmdbConstants.apiKey}&language=pt-BR";
  }
}
