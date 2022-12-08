import 'package:medical_trial/medical_trial.dart';
import 'package:medical_trial/src/medical_action.dart';
import 'package:medical_trial/src/medical_check_glucose.dart';
import 'package:medical_trial/src/medical_take_insulin.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Regimen reg = InitialRegimen();
    Regimen reg1 = InitialRegimen();
    DateTime time = DateTime(1999);
    MedicalCheckGlucose glu1 = MedicalCheckGlucose(time: time, glucoseUI: 30);
    MedicalCheckGlucose glu2 = MedicalCheckGlucose(time: time, glucoseUI: 40);
    MedicalCheckGlucose glu3 = MedicalCheckGlucose(time: time, glucoseUI: 90);

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      // Regimen reg2 = reg1;

      // reg2.medicalCheckGlucoses?.add(glu1);
      expect(reg, reg1);
    });
    test('Second Test', () {
      Regimen reg2 = reg1;
      MedicalCheckGlucose glu1 = MedicalCheckGlucose(time: time, glucoseUI: 30);

      reg2.medicalCheckGlucoses.add(glu1);
      expect(reg2, reg1);
    });
    test('test name', () {
      List<int> a = [3, 1];
      List<int> b = [...a];
      b.add(5);
      expect(b == a, false);
    });
    test('test3', () {
      List<MedicalCheckGlucose> a = [glu1.clone(), glu2.clone()];
      List<MedicalCheckGlucose> b = [...a];
      b.add(glu3);
      expect(b == a, false);
    });
    test('test4', () {
      List<MedicalCheckGlucose> a = [glu1.clone(), glu2.clone()];
      List<MedicalCheckGlucose> b = a;
      b.add(glu3);
      expect(b, a);
    });
    test('test5', () {
      List<MedicalCheckGlucose> a = [glu1.clone(), glu2.clone()];
      List<MedicalCheckGlucose> b = a;
      reg1.addMedicalAction(glu1);
      Regimen reg5 = Regimen(
        medicalActions: [glu1.clone()],
        medicalCheckGlucoses: [glu1.clone()],
        medicalTakeInsulins: [],
      );
      expect(reg1, reg5);
    });
    test('test6', () {
      List<MedicalCheckGlucose> a = [glu1.clone()];
      List<MedicalCheckGlucose> b = [...a];
      a[0].time = DateTime(2001);
      expect(a, b);
    });
    test('test7', () {
      List<MedicalCheckGlucose> a = [glu1.clone()];
      List<MedicalCheckGlucose> b = [
        for (MedicalCheckGlucose x in a) x.clone()
      ];
      a[0].time = DateTime(2001);
      expect(a == b, false);
    });
    test('print regimen', () {
      print(reg1);
    });
    test('print regimen 2', () {
      Regimen reg2 = reg1.clone();
      reg2.addMedicalAction(glu1);
      print(reg2.medicalCheckGlucoses);
      print(reg2);
    });
    test('print insulin results of regimen', () {
      Regimen reg2 = reg1.clone();
      reg2.addMedicalAction(glu1);
      dynamic ins1 = MedicalTakeInsulin(
        insulinType: InsulinType.Actrapid,
        time: DateTime.now(),
        insulinUI: 50,
      );
      reg2.addMedicalAction(ins1);
      print(reg2.medicalTakeInsulins);
    });
  });
}
