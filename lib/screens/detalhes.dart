import 'dart:developer';

import 'package:appfilmes/core/tmdb_constants.dart';
import 'package:appfilmes/models/detalhes_model.dart';
import 'package:appfilmes/services/movies_repository.dart';
import 'package:flutter/material.dart';

import '../core/style/app_colors.dart';

class Detalhes extends StatefulWidget {
  final int id;

  const Detalhes({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  @override
  Widget build(BuildContext context) {
    log(widget.id.toString());
    return FutureBuilder(
      future: MoviesRepository.getDetalhes(widget.id),
      builder: (BuildContext context, AsyncSnapshot<DetalhesModel?> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        DetalhesModel filme = snapshot.data!;
        return _scarffold(filme);
      },
    );
  }

  Widget _scarffold(DetalhesModel filme) {
    return SafeArea(
      child: Scaffold(        
        backgroundColor: AppColors.corFundo,
        appBar: _appBar(filme.backdropPath!),
        body: _body(filme),
      ),
    );
  }

  PreferredSize _appBar(String imagemUrl) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(360),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.corSeta),
          onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(TmdbConstants.imageBase + imagemUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(DetalhesModel filme) {
    return ListView(
      scrollDirection: Axis.vertical,     
      children: [
        Column(
          children: [
            const SizedBox(
              height: 31,
            ),
            SizedBox(
              width: 320,
              height: 64,
              child: Text(
                filme.title!,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.branco,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const SizedBox(
              width: 320,
              height: 32,
              child: Text(
                'Sinopse',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.laranja,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
             SizedBox(              
              width: 328,              
              child: Text(
                filme.overview!,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.branco,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,                  
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
          ],
        ),
      ],
    );
  }
}


















// import 'package:flutter/material.dart';

// import '../models/filme_model.dart';
// import '../services/movies_repository.dart';
// import '../style/colors.dart';
// import 'package:appfilmes/models/detalhes_model.dart';

// //https://www.youtube.com/watch?v=CI1-VmEWpUA&list=PL9n0l8rSshSmokaZASjYA26vvQq8HWDot&index=5
// //https://github.com/akmadan/tmdb_api_flutter

// class Detalhes extends StatefulWidget {
//   const Detalhes({Key? key}) : super(key: key);

//   @override
//   State<Detalhes> createState() => _DetalhesState();
// }

// class _DetalhesState extends State<Detalhes> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: MoviesRepository.getDetalhes(),
//         builder:
//             (BuildContext context, AsyncSnapshot<List<FilmeModel>?> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           }

//           List<FilmeModel> filmesDetalhados = snapshot.data as List<FilmeModel>;

//           return _materialDetalhes(filmesDetalhados);
//         });

//     // Widget _materialDetalhes(List<DetalhesModel> filmesDetalhados){
//     //
//   }
// }

// class _materialDetalhes {
//   _materialDetalhes(List<FilmeModel> filmesDetalhados);

//   //return MaterialApp(
//   //   debugShowCheckedModeBanner: false,
//   //   home: Scaffold(
//   //     backgroundColor: AppColors.corFundo,
//   //     appBar: PreferredSize(
//   //       preferredSize: const Size.fromHeight(360),
//   //       //preferredSize: const Size.square(360),
//   //       child: AppBar(
//   //         automaticallyImplyLeading: false,
//   //         leading: IconButton(
//   //           icon: const Icon(Icons.arrow_back, color: AppColors.corSeta),
//   //           onPressed: () => Navigator.of(context).pop(),
//   //         ),
//   //         flexibleSpace: Container(
//   //           decoration: const BoxDecoration(
//   //             image: DecorationImage(
//   //               image: NetworkImage('https://source.unsplash.com/random'),
//   //               fit: BoxFit.fill,
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //     body: ListView(
//   //       children: [
//   //         Column(
//   //           children: const [
//   //             SizedBox(
//   //               height: 31,
//   //             ),
//   //             SizedBox(
//   //               width: 320,
//   //               height: 64,
//   //               child: Text(
//   //                 'Tituloooooooooooo, titulooo..... 123',
//   //                 textAlign: TextAlign.justify,
//   //                 style: TextStyle(
//   //                   //fontFamily: 'Poppins',
//   //                   color: AppColors.branco,
//   //                   fontWeight: FontWeight.w700,
//   //                   fontSize: 24,
//   //                 ),
//   //               ),
//   //             ),
//   //             SizedBox(
//   //               height: 14,
//   //             ),
//   //             SizedBox(
//   //               width: 320,
//   //               height: 32,
//   //               child: Text(
//   //                 'Sinopse',
//   //                 textAlign: TextAlign.left,
//   //                 style: TextStyle(
//   //                   //fontFamily: 'Poppins',
//   //                   color: AppColors.laranja,
//   //                   fontWeight: FontWeight.w700,
//   //                   fontSize: 20,
//   //                 ),
//   //               ),
//   //             ),
//   //             SizedBox(
//   //               height: 17,
//   //             ),
//   //             SizedBox(
//   //               width: 328,
//   //               height: 180,
//   //               child: Text(
//   //                 'Indo da zona desmilitarizada entre a Coréia do Sul e a Coréia do Norte até Hong Kong, Cuba, Islândia e Londres, o agente secreto James Bond (Pierce Brosnan) precisa impedir os planos de Gustav Graves (Toby Stephens) e seu fiel braço-direito Zao (Rick Yune), que estão desenvolvendo uma arma de alta tecnologia que pode pôr o mundo novamente em guerra.',
//   //                 textAlign: TextAlign.justify,
//   //                 style: TextStyle(
//   //                   //fontFamily: 'Poppins',
//   //                   color: AppColors.branco,
//   //                   fontWeight: FontWeight.w400,
//   //                   fontSize: 14,
//   //                 ),
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       ],
//   //     ),
//   //   ),
//   // );
// }

// class HomeDetalhes extends StatefulWidget {
//   const HomeDetalhes({Key? key}) : super(key: key);

//   @override
//   State<HomeDetalhes> createState() => _HomeDetalhesState();
// }

// class _HomeDetalhesState extends State<HomeDetalhes> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: AppColors.corFundo,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(360),
//           //preferredSize: const Size.square(360),
//           child: AppBar(
//             automaticallyImplyLeading: false,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back, color: AppColors.corSeta),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             flexibleSpace: Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage('https://source.unsplash.com/random'),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         //body: _body,
//       ),
//     );
//   }

//   //Widget _body(List<DetalhesModel)
// }


