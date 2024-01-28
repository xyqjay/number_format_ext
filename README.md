

`Numberformat` extnsion, Added `floor` and `ceil` methods to `Numberformat`.

By default, the `format` method of `Numberformat` is `round`. This is the reason why I wrote this package.

## Features
- ✅ format `num`
- ✅ format `Decimal`
- ✅ floor
- ✅ ceil
    
## Getting started
If you use `decimal: ^1.5.0` please use: `number_format_ext: ^1.5.0`
If you use `decimal: ^2.3.0` please use: `number_format_ext: ^2.3.0`

```
dart pub get number_format_ext
# or
flutter pub get number_format_ext
```

## Usage
More example please see:
`./example/number_format_ext_example.dart` and `./test/number_format_ext_test.dart`

```dart
  final f22 = NumberFormat.decimalPattern();
  f22.minimumFractionDigits = 2;
  f22.maximumFractionDigits = 2;

  final d1_19 = Decimal.parse('1.111111111');
  print(f22.formatDecimalWithCondition(d1_19)); // 1.11 (default round)
  print(f22.formatDecimalWithCondition(d1_19, ceil: true)); // 1.12

  final d1_99 = Decimal.parse('1.999999999');
  print(f22.formatDecimalWithCondition(d1_99)); // 2.00 (default round)
  print(f22.formatDecimalWithCondition(d1_99, floor: true)); // 1.99
  
```

## Additional information

--
