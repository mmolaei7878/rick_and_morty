import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/model/character_model.dart';
import 'package:rick_and_morty/util/const_color.dart';

import 'life_status_widget.dart';

class CustomListTile extends StatelessWidget {
  final SingleCharacter singleCharacter;
  const CustomListTile({Key? key, required this.singleCharacter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Container(
      height: mediaquery.height * 0.15,
      width: mediaquery.height * 0.8,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ConstColor.listTileColor,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                child: Image.network(
                  singleCharacter.image,
                  fit: BoxFit.cover,
                ),
              )),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            singleCharacter.name,
                            style: GoogleFonts.alegreya(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        LifeStatusWidget(
                          text: singleCharacter.status,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Species',
                            style: GoogleFonts.andada(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(singleCharacter.species, style: GoogleFonts.andada(color: Colors.white)),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          style: GoogleFonts.andada(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(singleCharacter.gender, style: GoogleFonts.andada(color: Colors.white)),
                      ],
                    )),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
