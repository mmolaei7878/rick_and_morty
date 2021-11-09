import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/util/const_color.dart';
import 'package:rick_and_morty/view/shared/custom_list_tile.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchBloc searchBloc;
  CustomSearchDelegate(this.searchBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      searchBloc.add(StartToSearch(query));
    }
    print(query);
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchNotFoundState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                'Not Found',
                style: GoogleFonts.almarai(color: ConstColor.appbarColor, fontSize: 20),
              ),
            )
          ],
        );
      }
      if (state is SearchLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is SearchLoaded) {
        return Container(
          color: ConstColor.backgroundColor,
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: ListView.builder(
                    itemCount: state.characterModel?.singleCharacter.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomListTile(singleCharacter: state.characterModel!.singleCharacter[index]);
                    }),
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(
                        label: Text('${state.characterModel?.info.count} All'),
                        avatar: const Icon(Icons.countertops),
                      ),
                      Chip(
                        label: Text('${state.characterModel?.info.pages} Pages'),
                        avatar: const Icon(Icons.pages),
                      ),
                    ],
                  ))
            ],
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Center(
          child: Text(
            'Please enter at least 3 character',
            style: GoogleFonts.almarai(color: ConstColor.appbarColor, fontSize: 20),
          ),
        )
      ],
    );
  }
}
