import 'package:appfilmes/screens/tabs/maisAvaliados_tab.dart';
import 'package:appfilmes/screens/tabs/populares_tab.dart';
import 'package:appfilmes/style/colors.dart';
import 'package:appfilmes/style/theme.dart';
import 'package:flutter/material.dart';

class CorpoProjeto extends StatefulWidget {
  const CorpoProjeto({Key? key}) : super(key: key);

  @override
  State<CorpoProjeto> createState() => _CorpoProjetoState();
}

class _CorpoProjetoState extends State<CorpoProjeto> {
  bool themeMode = true;

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true,
      theme: themeMode ? MegaCineTheme.dark : MegaCineTheme.ligth,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Mega Cine',
            ),
            actions: [
              Switch(
                  value: themeMode,
                  onChanged: (newValue) {
                    setState(() {
                      themeMode = !themeMode;
                    });
                  })
            ],
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                //fontFamily: 'Poppins',
              ),
              indicatorWeight: 0.1,
              tabs: [
                Tab(
                  text: "Populares",
                ),
                Tab(text: 'Mais avaliados'),
                //style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500,
              ],
            ),
          ),

          //Troca de telas
          body: const TabBarView(
            children: [
              FilmesPopulares(),
              MaisAvalidos(),
            ],
          ),
        ),
      ),
    );
  }
}
