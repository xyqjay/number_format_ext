import 'package:intl/intl.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:rational/rational.dart';

extension ConditionalFormatting on NumberFormat {
  String formatWithCondition(dynamic number,
      {bool floor = false, bool ceil = false}) {
    if (floor == true && ceil == true) {
      throw Exception('Error, floor and ceil cannot be both true!');
    }

    if (number is num) {
      if (floor || ceil) {
        final newNum = Decimal.parse(number.toString());
        return _formatDecimalWithCondition(newNum, floor: floor, ceil: ceil);
      }
    } else if (number is Decimal) {
      return _formatDecimalWithCondition(number, floor: floor, ceil: ceil);
    } else if (number is Rational) {
      return _formatDecimalWithCondition(number.toDecimal(),
          floor: floor, ceil: ceil);
    } else if (number is String) {
      try {
        final newNum = Decimal.parse(number);
        return _formatDecimalWithCondition(newNum, floor: floor, ceil: ceil);
      } catch (e) {
        rethrow;
      }
    } else {
      throw Exception('Error, unsupport number type! ${number.runtimeType}');
    }

    return format(number);
  }

  String formatDecimalWithCondition(Decimal number,
      {bool floor = false, bool ceil = false}) {
    return _formatDecimalWithCondition(number, floor: floor, ceil: ceil);
  }

  String _formatDecimalWithCondition(Decimal number,
      {bool floor = false, bool ceil = false}) {
    if (floor == true && ceil == true) {
      throw Exception('Error, floor and ceil cannot be both true!');
    }

    if (floor) {
      final Decimal pow = Decimal.one.shift(maximumFractionDigits);
      number = ((number * pow).floor() / pow).toDecimal();
    } else if (ceil) {
      final Decimal pow = Decimal.one.shift(maximumFractionDigits);
      final Decimal newNum = ((number * pow).floor() / pow).toDecimal();
      if (newNum < number) {
        // There is a value at the end and a ceil is required.
        Decimal offSet = (Decimal.fromInt(1) / pow).toDecimal();
        number = newNum + offSet;
      }
    }
    return format(DecimalIntl(number));
  }
}
