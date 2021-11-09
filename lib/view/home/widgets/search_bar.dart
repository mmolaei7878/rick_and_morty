import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/util/const_color.dart';
import 'package:rick_and_morty/util/const_string.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: ConstColor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              onTap: () {
                Navigator.pushNamed(context, ConstString.searchScreenRoute);
              },
              readOnly: true,
              style: GoogleFonts.mountainsOfChristmas(color: Colors.black),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Name',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
