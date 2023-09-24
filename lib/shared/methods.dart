import 'package:intl/intl.dart';

getCurrentDate() {
  return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
}