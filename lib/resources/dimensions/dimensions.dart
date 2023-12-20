import 'package:flutter/material.dart';

class Dimensions {
  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getHorizontalPadding(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.02;

  static double getTileVerticalPadding(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.008;

  static double getTileHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.14;
  static double getTileRadius(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.025;

  static double getBookmarkSideValue(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.1;

  static double getLogoSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.17;

  static double getBookButtonHeight(BuildContext context) =>
      MediaQuery.of(context).size.height / 13;

  static double getBookButtonWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / 1.5;
}
