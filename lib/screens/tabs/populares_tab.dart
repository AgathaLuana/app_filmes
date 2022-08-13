import 'package:appfilmes/core/tmdb_constants.dart';
import 'package:appfilmes/models/filme_model.dart';
import 'package:appfilmes/services/movies_repository.dart';
import 'package:flutter/material.dart';
import '../../core/style/app_colors.dart';
import '../detalhes.dart';

class FilmesPopulares extends StatefulWidget {
  const FilmesPopulares({Key? key}) : super(key: key);

  @override
  State<FilmesPopulares> createState() => _FilmesPopularesState();
}

class _FilmesPopularesState extends State<FilmesPopulares> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MoviesRepository.getFilmesPopulares(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FilmeModel>?> snapshot) {
          //Se não tiver Data, recarregue
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          //Quando não for nulo, retorna o filme
          List<FilmeModel> filmes = snapshot.data!;

          return _body(filmes);
        });
  }

  Widget _body(List<FilmeModel> filmes) {
    // Size size = MediaQuery.of(context).size;

    return ListView.builder(
        itemCount: filmes.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, index) {
          FilmeModel filme = filmes[index];

          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detalhes(
                        id: filme.id,
                      ),
                    ),
                  );
                  ////Checa Id do Filme
                  //log(filme.id.toString());
                },
                child: Column(
                  children: [
                    Card(
                      child: SizedBox(
                        //fit: BoxFit.fill,
                        width: 101,
                        height: 138,
                        child: Image.network(
                          TmdbConstants.imageBase+filme.posterPath!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 101,
                height: 33,
                child: Text(
                  filme.title,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    //fontFamily: 'Poppins',
                    color: AppColors.branco,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
