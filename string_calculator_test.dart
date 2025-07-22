
import 'package:flutter_test/flutter_test.dart';

import '../string_calculator_kata.dart';

void main() {
  final calc = StringCalculator();

  test('Empty string returns 0', () {
    expect(calc.add(''), equals(0));
  });

  test('Single number returns the number', () {
    expect(calc.add('5'), equals(5));
  });

  test('Two comma-separated numbers return sum', () {
    expect(calc.add('1,2'), equals(3));
  });

  test('Supports newlines between numbers', () {
    expect(calc.add('1\n2,3'), equals(6));
  });

  test('Supports custom delimiter', () {
    expect(calc.add('//;\n1;2'), equals(3));
  });

  test('Throws on negative numbers', () {
    expect(() => calc.add('1,-2,3,-4'),
        throwsA(predicate((e) => e.toString().contains('-2,-4'))));
  });
}
