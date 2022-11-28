import 'package:medical_trial/medical_trial.dart';
import 'package:medical_trial/src/medical_action.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = MedicalAction(time: DateTime.now());

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome, isTrue);
    });
  });
}
