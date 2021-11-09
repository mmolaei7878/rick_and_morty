import 'package:flutter/material.dart';
import 'package:rick_and_morty/util/const_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ConstColor.backgroundColor,
    );
  }
}
