import 'package:medical_trial/src/medical_take_insulin.dart';
import 'package:test/test.dart';

void main() {
  group('take insulin test', () {
    MedicalTakeInsulin m1 = MedicalTakeInsulin(
      insulinType: InsulinType.Actrapid,
      time: DateTime.now(),
      insulinUI: 50,
    );
    MedicalTakeInsulin m2 = MedicalTakeInsulin(
      insulinType: InsulinType.Actrapid,
      time: DateTime.now(),
      insulinUI: 100,
    );
    MedicalTakeInsulin medicalTakeInsulin = MedicalTakeInsulin(
      insulinType: InsulinType.Actrapid,
      time: DateTime.now(),
      insulinUI: 50,
    );
    test('in object', () {
      print(medicalTakeInsulin);
    });
    test('print list take insulin', () {
      List<MedicalTakeInsulin> list1 = [m1.clone(), m2.clone()];
      String strTakeInsulin = list1.toString();
      print(strTakeInsulin);
    });
  });
}
