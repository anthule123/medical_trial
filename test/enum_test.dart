import 'package:medical_trial/medical_trial.dart';
import 'package:medical_trial/src/medical_action.dart';
import 'package:medical_trial/src/medical_take_insulin.dart';
import 'package:test/test.dart';

void main() {
  group('test enum', () {
    test('enum ', () {
      InsulinType a = InsulinType.Actrapid;
      print([a, a.runtimeType]);
    });
    
  });
}
