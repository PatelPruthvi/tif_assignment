import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif_assignment/resources/Colors/colors.dart';
import 'package:tif_assignment/resources/dimensions/dimensions.dart';

class Fonts {
  static TextStyle getTitleTextStyle(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: Dimensions.getScreenWidth(context) * 0.065);

  static TextStyle getTileIndigoTextStyle(BuildContext context) => TextStyle(
      fontSize: Dimensions.getScreenWidth(context) * 0.035,
      fontFamily: GoogleFonts.inter().fontFamily,
      color: AppColours.lightIndigoColorForTile);
  static TextStyle getTileTitleTextStyle(BuildContext context) => TextStyle(
      fontSize: Dimensions.getScreenWidth(context) * 0.04,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.inter().fontFamily,
      color: Colors.black);
  static TextStyle getTileFooterTextStyle(BuildContext context) => TextStyle(
      fontSize: Dimensions.getScreenWidth(context) * 0.035,
      color: Colors.grey,
      fontFamily: GoogleFonts.inter().fontFamily);

  static TextStyle getEventDetailsTitleTextStyle(BuildContext context) =>
      TextStyle(
          fontSize: Dimensions.getScreenWidth(context) * 0.09,
          fontFamily: GoogleFonts.inter().fontFamily,
          color: Colors.black);
  static TextStyle getEventDetailsCompanyNameStyle(BuildContext context) =>
      TextStyle(
          fontSize: Dimensions.getScreenWidth(context) * 0.045,
          fontFamily: GoogleFonts.inter().fontFamily,
          color: Colors.black);
  static TextStyle getEventDetailsAboutEventTextStyle(BuildContext context) =>
      TextStyle(
          fontSize: Dimensions.getScreenWidth(context) * 0.06,
          color: Colors.black,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w600);
  static TextStyle getEventDetailsParaTextStyle(BuildContext context) =>
      TextStyle(
          fontSize: Dimensions.getScreenWidth(context) * 0.045,
          color: Colors.black,
          fontFamily: GoogleFonts.inter().fontFamily,
          height: 1.5);
  static TextStyle getBookNowTextStyle(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: 1.2,
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: Dimensions.getScreenWidth(context) * 0.05);
}
