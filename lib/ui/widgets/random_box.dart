import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';

enum AssetType {
  image,
  gif,
}

class RandomBox extends StatefulWidget {
  final String title;
  final Function()? onTap;
  final String asset;
  final double width;
  final double height;
  final AssetType type;

  const RandomBox({
    super.key,
    required this.title,
    this.onTap,
    required this.asset,
    required this.width,
    required this.height,
    required this.type,
  });

  @override
  State<RandomBox> createState() => _RandomBoxState();
}

class _RandomBoxState extends State<RandomBox> {
  late GifController _gifController;

  @override
  void initState() {
    super.initState();
    if (widget.type == AssetType.gif) {
      _gifController = GifController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.type == AssetType.image)
              Image.asset(widget.asset,
                  width: widget.width, height: widget.height),
            if (widget.type == AssetType.gif)
              GifView.network(
                widget.asset,
                width: widget.width,
                height: widget.height,
                controller: _gifController,
              ),
            Text(
              widget.title,
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (widget.type == AssetType.gif) {
      _gifController.dispose();
    }
    super.dispose();
  }
}
