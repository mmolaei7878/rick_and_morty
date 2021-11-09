import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: MultiBlocProvider(providers: [
        BlocProvider<CharacterBloc>(
          create: (_) => CharacterBloc()..add(FetchCharacter()),
        ),
      ], child: const HomeScreen()),
    );
  }
}
