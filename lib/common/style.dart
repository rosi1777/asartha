import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color black = const Color(0xff1F2937);
Color white = const Color(0xffffffff);
Color grey = const Color(0xff6B7280);
Color primary = const Color(0xff246ee9);
Color secondary = const Color(0xff40c4ff);
Color hintText = const Color(0xaaaaaaaa);
Color snow = const Color(0xfff5f5f5);
Color red = const Color(0xffFF2400);

var email = GoogleFonts.poppins(
  fontSize: 12,
  color: grey,
);

var input = GoogleFonts.poppins(
  color: black,
  fontWeight: FontWeight.w400,
);

var textHint = GoogleFonts.poppins(
    color: hintText, fontSize: 14, fontWeight: FontWeight.w500);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, color: black),
  headline2: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, color: black),
  headline3: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w500, color: black),
  headline4: GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w600, color: black),
  headline5: GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w500, color: secondary),
  headline6: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: black),
  subtitle1: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: grey),
  subtitle2: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w400, color: grey),
  bodyText1: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2:
      GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: grey),
  button: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: white),
  caption: GoogleFonts.inter(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.inter(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
