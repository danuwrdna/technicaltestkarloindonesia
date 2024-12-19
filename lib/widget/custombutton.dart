import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;
  final Color colorText;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
   required this.height,
   required this.width,
   required this.color,
   required this.colorText,
 
   
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: colorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
