import 'package:number_format_ext/number_format_ext.dart';
import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:rational/rational.dart';

void main() {
  final f22 = NumberFormat.decimalPattern();
  final f28 = NumberFormat.decimalPattern();

  f22.minimumFractionDigits = 2;
  f22.maximumFractionDigits = 2;

  f28.minimumFractionDigits = 2;
  f28.maximumFractionDigits = 8;

  final rational = Rational.parse('1.999999');
  // formater can't format Rational, please use formatWithCondition
  // print(f22.format(rational));

  /// !!!
  /*
  Direct use of double for precise calculations (such as finance) will cause accuracy problems. 
  It is not recommended to use double directly.
  Please use Decimal! Or you can customize some methods.

  // customize methods.
  // see: https://levelup.gitconnected.com/floating-point-arithmetic-issue-in-dart-189ccc1a78e8
  */
  print(0.3.toString()); // 0.3
  print((0.2 + 0.1).toString()); // 0.30000000000000004
  print(f28.formatWithCondition(0.3)); // 0.30
  print(f28.formatWithCondition(0.2 + 0.1)); // .30
  print(f28.formatWithCondition(0.2 + 0.1, ceil: true)); // 0.30000001

  /// Decimal is fine
  final d1 = Decimal.fromInt(1);
  print(f22.formatDecimalWithCondition(d1)); // 1.00
  print(f22.formatDecimalWithCondition(d1, floor: true)); // 1.00
  print(f22.formatDecimalWithCondition(d1, ceil: true)); // 1.00
  print(f28.formatDecimalWithCondition(d1)); // 1.00
  print(f28.formatDecimalWithCondition(d1, floor: true)); // 1.00
  print(f28.formatDecimalWithCondition(d1, ceil: true)); // 1.00

  final d1_19 = Decimal.parse('1.111111111');
  print(f22.formatDecimalWithCondition(d1_19)); // 1.11
  print(f22.formatDecimalWithCondition(d1_19, floor: true)); // 1.11
  print(f22.formatDecimalWithCondition(d1_19, ceil: true)); // 1.12
  print(f28.formatDecimalWithCondition(d1_19)); // 1.11111111
  print(f28.formatDecimalWithCondition(d1_19, floor: true)); // 1.11111111
  print(f28.formatDecimalWithCondition(d1_19, ceil: true)); // 1.11111112

  final d1_08_1 = Decimal.parse('1.000000001');
  print(f22.formatDecimalWithCondition(d1_08_1)); // 1.00
  print(f22.formatDecimalWithCondition(d1_08_1, floor: true)); // 1.00
  print(f22.formatDecimalWithCondition(d1_08_1, ceil: true)); // 1.01
  print(f28.formatDecimalWithCondition(d1_08_1)); // 1.00
  print(f28.formatDecimalWithCondition(d1_08_1, floor: true)); // 1.00
  print(f28.formatDecimalWithCondition(d1_08_1, ceil: true)); // 1.00000001

  final d1_99 = Decimal.parse('1.999999999');
  print(f22.formatDecimalWithCondition(d1_99)); // 2.00
  print(f22.formatDecimalWithCondition(d1_99, floor: true)); // 1.99
  print(f22.formatDecimalWithCondition(d1_99, ceil: true)); // 2.00
  print(f28.formatDecimalWithCondition(d1_99)); // 2.00
  print(f28.formatDecimalWithCondition(d1_99, floor: true)); // 1.99999999
  print(f28.formatDecimalWithCondition(d1_99, ceil: true)); // 2.00
}
