import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles{
  final titleTextStyle = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 18,
      decoration: TextDecoration.underline,
      color: Colors.black54,
    )
  );
  final subtitleTextStyle = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 13,
      decoration: TextDecoration.none,
      color: Colors.grey
    ),
  );
}