import 'package:flutter/material.dart';
import 'package:unknown/ui/widgets/justify_text.dart';
import 'package:unknown/ui/widgets/label_outline.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final int number;
  final Function()? onTap;
  final String subtitle;
  const InfoBox(
      {super.key,
      required this.title,
      required this.number,
      this.onTap,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 16,
      children: [
        LabelOutline(label: title, number: number, onTap: onTap),
        JustifyText(text: subtitle),
      ],
    );
  }
}
