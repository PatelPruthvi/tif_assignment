import 'package:intl/intl.dart';

class Utilities {
  static String dateInDayDateMonthFormat(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatedDate = DateFormat("EEE d, MMM • hh:mm a").format(dateTime);
    return formatedDate;
  }

  static String dateINDDMMMYYYformat(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatedDate = DateFormat("d MMMM, y").format(dateTime);
    return formatedDate;
  }

  static String getDayAndTime(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatedDate = DateFormat("EEEE, hh:mm a").format(dateTime);
    return formatedDate;
  }

  static String getDateInSearchScreen(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formatedDate = getDayOfMonthSuffix(dateTime.day);

    formatedDate +=
        DateFormat("MMM-EEE-hh:mm a").format(dateTime).toUpperCase();
    return formatedDate;
  }

  static String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return '${dayNum}TH ';
    }

    switch (dayNum % 10) {
      case 1:
        return '${dayNum}ST ';
      case 2:
        return '${dayNum}ND ';
      case 3:
        return '${dayNum}RD ';
      default:
        return '${dayNum}TH ';
    }
  }
}
