import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/util/const_color.dart';

class CustomErrorWidget extends StatelessWidget {
  final Function? onTap;
  const CustomErrorWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => onTap, icon: const Icon(Icons.refresh_outlined), label: const Text('Retry'))
        ],
      ),
    );
  }
}
