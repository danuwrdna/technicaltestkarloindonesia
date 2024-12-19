import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TableCustom extends StatelessWidget {
  final String title;
  final String subtitle;
 final VoidCallback onPressed;

  const TableCustom({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        child: Container(
           padding:const EdgeInsets.only(top: 5,left: 20, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
             const  SizedBox(height: 10), 
              
              Text(
                subtitle,
                style:  GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
