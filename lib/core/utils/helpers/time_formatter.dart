import 'package:intl/intl.dart';

String timeFormatter(DateTime? date) {
  return DateFormat('h:mm a').format(date ?? DateTime.now());
}
