import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JustifyText extends StatelessWidget {
  final String text;

  const JustifyText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: GoogleFonts.poppins(
          fontSize: 12,
          height: 1.5,
        ),
      ),
    );
  }
}
