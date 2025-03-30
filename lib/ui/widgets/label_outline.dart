import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unknown/ui/common/ui_helpers.dart';

class LabelOutline extends StatefulWidget {
  final String label;
  final int? number;
  final Function()? onTap;
  const LabelOutline({super.key, required this.label, this.number, this.onTap});

  @override
  _LabelOutlineState createState() => _LabelOutlineState();
}

class _LabelOutlineState extends State<LabelOutline> {
  Color containerColor = Colors.white;
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          containerColor = Colors.black;
          isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          containerColor = Colors.white;
          isHovering = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          padding: EdgeInsets.symmetric(horizontal: ti),
          decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Wrap(
            spacing: ti,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              if (widget.number != null)
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: isHovering ? Colors.white : Colors.black,
                    child: Center(
                      child: Text(
                        widget.number.toString(),
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: isHovering ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isHovering ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
