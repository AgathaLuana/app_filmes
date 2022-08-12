import 'package:flutter/material.dart';

import '../style/colors.dart';

class Detalhes extends StatefulWidget {
  const Detalhes({Key? key}) : super(key: key);

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.corFundo,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(360),
          //preferredSize: const Size.square(360),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.corSeta),
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://source.unsplash.com/random'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: const [
                SizedBox(
                  height: 31,
                ),
                SizedBox(
                  width: 320,
                  height: 64,
                  child: Text(
                    'Tituloooooooooooo, titulooo..... 123',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      //fontFamily: 'Poppins',
                      color: AppColors.branco,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                SizedBox(
                  width: 320,
                  height: 32,
                  child: Text(
                    'Sinopse',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      //fontFamily: 'Poppins',
                      color: AppColors.laranja,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 328,
                  height: 180,
                  child: Text(
                    'Indo da zona desmilitarizada entre a Coréia do Sul e a Coréia do Norte até Hong Kong, Cuba, Islândia e Londres, o agente secreto James Bond (Pierce Brosnan) precisa impedir os planos de Gustav Graves (Toby Stephens) e seu fiel braço-direito Zao (Rick Yune), que estão desenvolvendo uma arma de alta tecnologia que pode pôr o mundo novamente em guerra.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      //fontFamily: 'Poppins',
                      color: AppColors.branco,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // body: Padding(
      //  padding: const EdgeInsets.all(50.0),
    );
  }
}
