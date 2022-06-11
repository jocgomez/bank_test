import 'package:intl/intl.dart';

class FormatAmount {
  static String format(double value) {
    final NumberFormat currency = NumberFormat.currency(
      locale: 'eu',
      symbol: '',
      decimalDigits: 0,
      customPattern: '#,###',
    );
    return '${(value - 1) < -1 ? 0 : ""}${currency.format(value)}';
  }
}
