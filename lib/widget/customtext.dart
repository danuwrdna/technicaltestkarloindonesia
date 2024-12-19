import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final TextAlign align;

  const CustomText(
      {Key? key,
      required this.text,
      required this.color,
      required this.size,
      required this.fontWeight,
      required this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.inter(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
