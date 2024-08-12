import 'package:intl/intl.dart';

class Validators {
  
  static String? validate({
    required List<String> validators,
    String? value
  }) {
    String? error;
    for (final String v in validators) {
      switch (v) {
        case 'required':
          if (value == null || value.isEmpty) {
            error = 'Please enter some text';
          }
          break;
        case 'validate_date':
          String date =  value ?? '';
          DateFormat formato = DateFormat('dd/MM/yyyy');
          late DateTime parsedDate;
          try {
            parsedDate = formato.parseStrict(date);
          } catch (e) {
            error = 'Invalid date';
          }

          try {
            DateTime currentDate = DateTime.now();
            currentDate = DateTime(currentDate.year, currentDate.month, currentDate.day);
            if(!parsedDate.isAfter(currentDate)) {
              error = 'The year must be greater than today.';
            }
            if (parsedDate.year > 2070) {
              error = 'The year must be earlier than 2070.';
            }
          } catch (e) {
            error = 'Invalid date';
          }
          break;
        default:
      }
      if (error is String) {
        break;
      }
    }
    return error;
  }

}