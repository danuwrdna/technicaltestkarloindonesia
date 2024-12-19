import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final ValueChanged<String> onChanged; // Menggunakan tipe ValueChanged

  const CustomTextField({
    Key? key,
    required this.text,
    required this.controller,
    required this.onChanged, // Menerima callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 182, 182, 182),
            ),
          ),
          hintText: text,
          hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w100),
        ),
        onChanged: onChanged, // Memanggil callback ketika teks berubah
      ),
    );
  }
}
