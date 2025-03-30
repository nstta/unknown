import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParenthesisText extends StatelessWidget {
  final String text;
  final TextDecoration? underline;
  final EdgeInsets? padding;

  const ParenthesisText(
      {Key? key, required this.text, this.underline, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '(',
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.w200,
            ),
          ),
          Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                decoration: underline ?? TextDecoration.none,
              ),
            ),
          ),
          Text(
            ')',
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
