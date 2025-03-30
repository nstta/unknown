import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayCartCard extends StatelessWidget {
  final String name;
  final String? count;
  final String price;
  final String image;
  const DisplayCartCard(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: Image.asset(image, width: 50, height: 50),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(name, style: GoogleFonts.poppins(fontSize: 12)),
                ),
                Text(' x${count ?? ''}',
                    style: GoogleFonts.poppins(fontSize: 12)),
              ],
            ),
            Text(price, style: GoogleFonts.poppins(fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
