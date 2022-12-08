import 'package:medical_trial/src/medical_action.dart';
import 'package:medical_trial/src/medical_check_glucose.dart';
import 'package:test/test.dart';

void main() {
  DateTime a = DateTime(1999, 1);
  group('group of test', () {
    MedicalCheckGlucose A = MedicalCheckGlucose(time: a, glucoseUI: 50);
    MedicalCheckGlucose B = A;
    test('First test', () {
      expect(A, B);
    });
    test(
      'Second test', //class này sẽ bị copy cả reference
      () {
        A.time = DateTime(2003);
        expect(B.time, DateTime(2003));
        print(A);
      },
    );
    test(
      'Third test', //class này sẽ bị copy cả reference
      () {
        B.time = DateTime(2004);
        expect(A.time, DateTime(2004));
        print(A);
      },
    );
    test('4', () {
      MedicalCheckGlucose c = A.clone();
      expect(c, A);
    });
    test('5', () {
      MedicalCheckGlucose c = A.clone();
      c.time = DateTime(2010);
      expect(c, A);
    });
    test('print medical check glucose', () {
      MedicalCheckGlucose medicalCheckGlucose =
       MedicalCheckGlucose(
        time: DateTime.now(),
        glucoseUI: 100,
      );
      print(medicalCheckGlucose);
    });
  });
}
