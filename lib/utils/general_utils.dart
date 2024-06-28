import 'package:intl/intl.dart';

class GeneralUtils {
  static String formatDateFromString(String? date) {
    if (date != null) {
      DateTime parsedDate = DateTime.parse(date);
      String formattedDate = DateFormat('dd MMMM, yyyy').format(parsedDate);
      return formattedDate;
    }
    return '';
  }
}
