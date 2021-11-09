import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LifeStatusWidget extends StatelessWidget {
  final String text;
  Color characterLifeStatus(String status) {
    if (status == 'Alive') {
      return Colors.green;
    } else if (status == 'Dead') {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  const LifeStatusWidget({
    Key? key,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: characterLifeStatus(text), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: GoogleFonts.alegreya(color: Colors.white),
        )
      ],
    );
  }
}
