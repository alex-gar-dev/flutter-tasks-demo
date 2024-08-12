import 'package:intl/intl.dart';

class ParserDates {
  static String parseDate({
    required String date,
    String format = 'dd/MM/yyyy',
    String initalFormat = 'yyyy-MM-dd'
  }) {
    try {
      DateFormat firstDate = DateFormat(initalFormat);
      DateTime parsedDate = firstDate.parse(date);
      DateFormat newFormat = DateFormat(format);
      return newFormat.format(parsedDate);
    } catch (_) {
      return '';
    }
  }
}