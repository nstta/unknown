import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unknown/services/store_service.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(product.image, width: 50, height: 50),
          const Divider(color: Colors.black),
          Text(product.name, style: GoogleFonts.poppins(fontSize: 12)),
        ],
      ),
    );
  }
}
