import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/util/const_string.dart';
import 'package:rick_and_morty/view/search/search_screen.dart';

import 'bloc/character_bloc/characterbloc_bloc.dart';
import 'view/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ConstString.homeScreenRoute: (_) => const HomeScreen(),
        ConstString.searchScreenRoute: (_) => const SearchScreen(),
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CharacterBloc>(
            create: (_) => CharacterBloc()..add(FetchCharacter()),
          ),
          BlocProvider<SearchBloc>(
            create: (_) => SearchBloc(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
