import 'package:medical_trial/medical_trial.dart';
import 'package:medical_trial/src/medical_action.dart';
import 'package:medical_trial/src/no_insulin/no_insulin_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('No Insulin Cubit', () {
    NoInsulinCubit noInsulinCubit = NoInsulinCubit();
    setUp(() {
      noInsulinCubit = NoInsulinCubit();
    });
    tearDown(() {
      noInsulinCubit.close();
    });
    test('Khởi tạo', () {
      expect(noInsulinCubit, NoInsulinCubit());
    });
  });
}
