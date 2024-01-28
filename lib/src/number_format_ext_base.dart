import 'package:intl/intl.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';

extension ConditionalFormatting on NumberFormat {
  String formatWithCondition(num number,
      {bool floor = false, bool ceil = false}) {
    if (floor == true && ceil == true) {
      throw Exception('Error, floor and ceil cannot be both true!');
    }

    if (floor || ceil) {
      final newNum = Decimal.parse(number.toString());
      return formatDecimalWithCondition(newNum, floor: floor, ceil: ceil);
    }
    return format(number);
  }

  static final Decimal _d10 = Decimal.fromInt(10);

  String formatDecimalWithCondition(Decimal number,
      {bool floor = false, bool ceil = false}) {
    if (floor == true && ceil == true) {
      throw Exception('Error, floor and ceil cannot be both true!');
    }

    if (floor) {
      final Decimal pow = _d10.pow(maximumFractionDigits);
      number = (number * pow).floor() / pow;
    } else if (ceil) {
      final Decimal pow = _d10.pow(maximumFractionDigits);
      final Decimal newNum = (number * pow).floor() / pow;
      if (newNum < number) {
        // There is a value at the end and a ceil is required.
        Decimal offSet = Decimal.fromInt(1) / pow;
        number = newNum + offSet;
      }
    }
    return format(DecimalIntl(number));
  }
}
