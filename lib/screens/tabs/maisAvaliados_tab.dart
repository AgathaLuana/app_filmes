import 'package:appfilmes/core/tmdb_constants.dart';
import 'package:flutter/material.dart';

import '../../core/style/app_colors.dart';
import '../../models/filme_model.dart';
import '../../services/movies_repository.dart';
import '../detalhes.dart';

class MaisAvalidos extends StatefulWidget {
  const MaisAvalidos({Key? key}) : super(key: key);

  @override
  State<MaisAvalidos> createState() => _MaisAvalidosState();
}

class _MaisAvalidosState extends State<MaisAvalidos> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MoviesRepository.getMaisAvaliados(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FilmeModel>?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          List<FilmeModel> filmes = snapshot.data!;

          return _bodyMaisAvaliados(filmes);
        });
  }

  Widget _bodyMaisAvaliados(List<FilmeModel> filmes) {
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
                },
                child: Column(
                  children: [
                    Card(
                      child: SizedBox(
                        width: 101,
                        height: 138,
                        child: Image.network(
                         TmdbConstants.imageBase + filme.posterPath!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 100,
                height: 40,
                child: Text(
                  filme.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
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
