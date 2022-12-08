import 'package:medical_trial/medical_trial.dart';
import 'package:medical_trial/src/medical_action.dart';
import 'package:test/test.dart';
import 'dart:math';

void main() {
  group('A group of tests', () {
    test('2.5 to 3', () {
      double a = 2.5;
      dynamic b = a.round();
      print(b.runtimeType);
      expect(b, 3);
    });
    test('3.5 to 4', () {
      double a = 3.5;
      dynamic b = a.round();
      print(b.runtimeType);
      expect(b, 4);
    });
  });
}
