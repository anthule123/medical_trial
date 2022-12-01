import 'package:medical_trial/medical_trial.dart';
import 'package:medical_trial/src/medical_action.dart';
import 'package:test/test.dart';

void main() {
  DateTime a = DateTime.now();
  DateTime b = DateTime(1999);
  group('A group of tests', () {
    MedicalAction medication_action = MedicalAction(time: DateTime.now());
    MedicalAction medication_action2 = MedicalAction(time: DateTime.now());
    MedicalAction medication_action3 = MedicalAction(time: DateTime.now());
    medication_action3.time = a;
    medication_action.time = a;
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(medication_action, medication_action3);
      print('Hello');
    });
    test('Second Test', () {
      medication_action3.time = DateTime(2000);
      expect(medication_action, medication_action2);
      print('Hello');
    });
    test('Third Test', () {
      expect(medication_action, medication_action);
      print('Hello');
    });
    test('4', () {
      MedicalAction b = medication_action;
      b.time = DateTime(2007);
      expect(b, medication_action);
    });
    // test('5', () {
    //   MedicalAction c = copy(medication_action);
    //   medication_action.time = DateTime(2003);
    //   c.time = DateTime(2007);
    //   expect(c, medication_action);
    // });
    test('6', () {
      MedicalAction d = medication_action.clone();
      medication_action.time = DateTime(2003);
      d.time = DateTime(2007);
      expect(d, medication_action);
    });
  });
}
