import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../detalhes.dart';

class MaisAvalidos extends StatefulWidget {
  const MaisAvalidos({Key? key}) : super(key: key);

  @override
  State<MaisAvalidos> createState() => _MaisAvalidosState();
}

class _MaisAvalidosState extends State<MaisAvalidos> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Detalhes()),
                    );
                  },
                  child: Column(
                    children: [
                      Card(
                        child: SizedBox(
                          //fit: BoxFit.fill,
                          width: 101,
                          height: 138,
                          child: Image.network(
                            'https://source.unsplash.com/random',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 101,
                  height: 33,
                  child: Text(
                    'teste  1..............2........3.........foi? TESTEEEEEEEEEEEEEEEEEEEE ??? !!!!',
                    textAlign: TextAlign.end,
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
    );
  }
}
