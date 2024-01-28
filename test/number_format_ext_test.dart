import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:number_format_ext/number_format_ext.dart';
import 'package:test/test.dart';
import 'package:rational/rational.dart';

void main() {
  group('Testing...', () {
    final f22 = NumberFormat.decimalPattern();
    final f28 = NumberFormat.decimalPattern();

    setUp(() {
      f22.minimumFractionDigits = 2;
      f22.maximumFractionDigits = 2;

      f28.minimumFractionDigits = 2;
      f28.maximumFractionDigits = 8;
    });

    test('Case 1: 1', () {
      final number = 1;
      final decimal = Decimal.fromInt(1);
      final res22 = '1.00';
      final res28 = '1.00';
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), res22);
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), res22);

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(f28.formatDecimalWithCondition(decimal, floor: true), res28);
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), res28);

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), res22);
      expect(f22.formatWithCondition(number, ceil: true), res22);

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), res28);
    });

    test('Case 2: 1.01', () {
      final number = 1.01;
      final decimal = Decimal.parse('1.01');
      final res22 = '1.01';
      final res28 = '1.01';
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), res22);
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), res22);

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(f28.formatDecimalWithCondition(decimal, floor: true), res28);
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), res28);

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), res22);
      expect(f22.formatWithCondition(number, ceil: true), res22);

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), res28);
    });

    test('Case 3: 1.001', () {
      final number = 1.001;
      final decimal = Decimal.parse('1.001');
      final res22 = '1.00';
      final res28 = '1.001';
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), res22);
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), '1.01');

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(f28.formatDecimalWithCondition(decimal, floor: true), res28);
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), res28);

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), res22);
      expect(f22.formatWithCondition(number, ceil: true), '1.01');

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), res28);
    });

    test('Case 4: 1.00000001 (8 Fraction Digits)', () {
      final number = 1.00000001; // 8 Fraction Digits
      final decimal = Decimal.parse('1.00000001'); // 8 Fraction Digits
      final res22 = '1.00';
      final res28 = '1.00000001'; // 8 Fraction Digits
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), res22);
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), '1.01');

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(f28.formatDecimalWithCondition(decimal, floor: true), res28);
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), res28);

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), res22);
      expect(f22.formatWithCondition(number, ceil: true), '1.01');

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), res28);
    });

    test('Case 5: 1.000000001 (9 Fraction Digits)', () {
      final number = 1.000000001; // 9 Fraction Digits
      final decimal = Decimal.parse('1.000000001'); // 9 Fraction Digits
      final res22 = '1.00';
      final res28 = '1.00';
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), res22);
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), '1.01');

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(f28.formatDecimalWithCondition(decimal, floor: true), res28);
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), '1.00000001');

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), res22);
      expect(f22.formatWithCondition(number, ceil: true), '1.01');

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), '1.00000001');
    });

    test('Case 6: 1.11111111 (8 Fraction Digits)', () {
      final number = 1.11111111; // 8 Fraction Digits
      final decimal = Decimal.parse('1.11111111'); // 8 Fraction Digits
      final res22 = '1.11';
      final res28 = '1.11111111'; // 8 Fraction Digits
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), res22);
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), '1.12');

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(f28.formatDecimalWithCondition(decimal, floor: true), res28);
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), res28);

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), res22);
      expect(f22.formatWithCondition(number, ceil: true), '1.12');

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), res28);
    });

    test('Case 7: 1.111111111 (9 Fraction Digits)', () {
      final number = 1.111111111; // 9 Fraction Digits
      final decimal = Decimal.parse('1.111111111'); // 9 Fraction Digits
      final res22 = '1.11';
      final res28 = '1.11111111'; // 8 Fraction Digits
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), res22);
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), '1.12');

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(f28.formatDecimalWithCondition(decimal, floor: true), res28);
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), '1.11111112');

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), res22);
      expect(f22.formatWithCondition(number, ceil: true), '1.12');

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), '1.11111112');
    });

    test('Case 8: 1.99999999 (8 Fraction Digits)', () {
      final number = 1.99999999; // 8 Fraction Digits
      final decimal = Decimal.parse('1.99999999'); // 8 Fraction Digits
      final res22 = '2.00';
      final res28 = '1.99999999'; // 8 Fraction Digits
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), '1.99');
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), res22);

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(f28.formatDecimalWithCondition(decimal, floor: true), res28);
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), res28);

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), '1.99');
      expect(f22.formatWithCondition(number, ceil: true), res22);

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), res28);
    });

    test('Case 9: 1.999999999 (9 Fraction Digits)', () {
      final number = 1.999999999; // 9 Fraction Digits
      final decimal = Decimal.parse('1.999999999'); // 9 Fraction Digits
      final res22 = '2.00';
      final res28 = '2.00';
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), '1.99');
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), res22);

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(
          f28.formatDecimalWithCondition(decimal, floor: true), '1.99999999');
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), res28);

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), '1.99');
      expect(f22.formatWithCondition(number, ceil: true), res22);

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), '1.99999999');
      expect(f28.formatWithCondition(number, ceil: true), res28);
    });

    test('Case 10: 1.11000001 (8 Fraction Digits)', () {
      final number = 1.11000001; // 8 Fraction Digits
      final decimal = Decimal.parse('1.11000001'); // 8 Fraction Digits
      final res22 = '1.11';
      final res28 = '1.11000001'; // 8 Fraction Digits
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), res22);
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), '1.12');

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(f28.formatDecimalWithCondition(decimal, floor: true), res28);
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), res28);

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), res22);
      expect(f22.formatWithCondition(number, ceil: true), '1.12');

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), '1.11000001');
    });

    test('Case 11: 1.110000001 (9 Fraction Digits)', () {
      final number = 1.110000001; // 9 Fraction Digits
      final decimal = Decimal.parse('1.110000001'); // 9 Fraction Digits
      final res22 = '1.11';
      final res28 = '1.11';
      expect(f22.formatDecimalWithCondition(decimal), res22);
      expect(f22.formatDecimalWithCondition(decimal, floor: true), res22);
      expect(f22.formatDecimalWithCondition(decimal, ceil: true), '1.12');

      expect(f28.formatDecimalWithCondition(decimal), res28);
      expect(f28.formatDecimalWithCondition(decimal, floor: true), res28);
      expect(f28.formatDecimalWithCondition(decimal, ceil: true), '1.11000001');

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), res22);
      expect(f22.formatWithCondition(number, ceil: true), '1.12');

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), '1.11000001');
    });

    test('Case 12 Rational: 1.110000001 (9 Fraction Digits)', () {
      final number = 1.110000001; // 9 Fraction Digits
      final decimal = Decimal.parse('1.110000001'); // 9 Fraction Digits
      final rational = Rational.parse('1.110000001'); // 9 Fraction Digits
      final res22 = '1.11';
      final res28 = '1.11';
      expect(f22.formatWithCondition(decimal), res22);
      expect(f22.formatWithCondition(decimal, floor: true), res22);
      expect(f22.formatWithCondition(decimal, ceil: true), '1.12');

      expect(f28.formatWithCondition(decimal), res28);
      expect(f28.formatWithCondition(decimal, floor: true), res28);
      expect(f28.formatWithCondition(decimal, ceil: true), '1.11000001');

      expect(f22.formatWithCondition(number), res22);
      expect(f22.formatWithCondition(number, floor: true), res22);
      expect(f22.formatWithCondition(number, ceil: true), '1.12');

      expect(f28.formatWithCondition(number), res28);
      expect(f28.formatWithCondition(number, floor: true), res28);
      expect(f28.formatWithCondition(number, ceil: true), '1.11000001');

      expect(f22.formatWithCondition(rational), res22);
      expect(f22.formatWithCondition(rational, floor: true), res22);
      expect(f22.formatWithCondition(rational, ceil: true), '1.12');

      expect(f28.formatWithCondition(rational), res28);
      expect(f28.formatWithCondition(rational, floor: true), res28);
      expect(f28.formatWithCondition(rational, ceil: true), '1.11000001');
    });

    test('test', () {
      expect(f22.formatWithCondition(1.110000001, ceil: true), '1.12');
    });
  });
}
