import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/bloc/character_bloc/characterbloc_bloc.dart';
import 'package:rick_and_morty/util/const_color.dart';
import 'custom_list_tile.dart';

class DownListView extends StatelessWidget {
  DownListView({Key? key}) : super(key: key);
  final scrollController = ScrollController();

  void onScrollMethod(BuildContext context) {
    scrollController.addListener(
      () async {
        if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
          context.read<CharacterBloc>().add(FetchCharacterWithPagination());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    onScrollMethod(context);
    return Expanded(
      flex: 8,
      child: Container(
        color: ConstColor.backgroundColor,
        child: BlocBuilder<CharacterBloc, CharacterblocState>(
          builder: (context, state) {
            if (state is CharacterblocError) {
              return Container(
                color: ConstColor.backgroundColor,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'An Error Occured',
                      style: GoogleFonts.aclonica(color: Colors.white70, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          context.read<CharacterBloc>().add(FetchCharacterWithPagination());
                        },
                        icon: const Icon(Icons.refresh_outlined),
                        label: const Text('Retry'))
                  ],
                ),
              );
            }
            if (state is CharacterblocLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CharacterblocSucess) {
              return ListView.builder(
                  controller: scrollController,
                  itemCount: state.characterModel.singleCharacter.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomListTile(singleCharacter: state.characterModel.singleCharacter[index]);
                  });
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}
