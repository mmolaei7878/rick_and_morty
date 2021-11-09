import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/util/const_color.dart';
import 'widgets/down_list_view.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstColor.appbarColor,
        title: Text(
          'Rick And Morty',
          style: GoogleFonts.mountainsOfChristmas(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          SearchBar(),
          DownListView(),
        ],
      ),
    );
  }
}
