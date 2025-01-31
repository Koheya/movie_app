import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.white),
    );
  }
}
