import 'package:bloc_test/bloc_test.dart';
import 'package:medical_trial/medical_trial.dart';
import 'package:medical_trial/src/medical_action.dart';
import 'package:medical_trial/src/medical_check_glucose.dart';
import 'package:medical_trial/src/no_insulin/no_insulin_cubit.dart';
import 'package:test/test.dart';

void main() {
  Regimen r0 = InitialRegimen();
  dynamic glu1 = MedicalCheckGlucose(time: DateTime.now(), glucoseUI: 50);
  group('No Insulin Cubit', () {
    NoInsulinCubit noInsulinCubit = NoInsulinCubit();
    setUp(() {
      noInsulinCubit = NoInsulinCubit();
    });
    tearDown(() {
      noInsulinCubit.close();
    });
    test('Khởi tạo', () {
      expect(noInsulinCubit.state, NoInsulinState(regimen: InitialRegimen()));
    });
    test('Khởi tạo với regimen khác rỗng', () {
      Regimen reg1 = InitialRegimen();
      reg1.addMedicalAction(glu1);
      noInsulinCubit = NoInsulinCubit();
      noInsulinCubit.state.regimen = reg1.clone();
      print(noInsulinCubit.state.regimen);
    });
    test('test get cho', () {
      noInsulinCubit.getCarbonhydrate(100);
      print(noInsulinCubit.state.guide);
    });
    test('test glucose 4', () {
      noInsulinCubit.getCarbonhydrate(100);
      print(noInsulinCubit.state.guide);
      noInsulinCubit.takeGlucose(4);
      print(noInsulinCubit.state.guide);
    });
    test('test glucose 9', () {
      noInsulinCubit.getCarbonhydrate(100);
      print(noInsulinCubit.state.guide);
      noInsulinCubit.takeGlucose(9);
      print(noInsulinCubit.state.guide);
    });
    test('test get guide', () {
      noInsulinCubit.getCarbonhydrate(100);
      noInsulinCubit.takeGlucose(9);
      print(noInsulinCubit.state.guide);
      noInsulinCubit.getGuide();
      print(noInsulinCubit.state.regimen);
    });
    test('test get guide glu 13', () {
      noInsulinCubit.getCarbonhydrate(100);
      noInsulinCubit.takeGlucose(13);
      print(noInsulinCubit.state.guide);
      noInsulinCubit.getGuide();
      print(noInsulinCubit.state.regimen);
    });
    test('Màn hình nhập CHO khi khởi tạo rỗng', () {
      expect(noInsulinCubit.state.medicalStatus, MedicalStatus.gettingCHO);
    });
    test('Màn hình nhập glucose sau khi nhập xong CHO', () {
      noInsulinCubit.getCarbonhydrate(200);
      expect(noInsulinCubit.state.medicalStatus, MedicalStatus.checkingGlucose);
    });
    test('Màn hình chỉ dẫn tiêm insulin sau khi nhập xong glucose', () {
      noInsulinCubit.getCarbonhydrate(200);
      noInsulinCubit.takeGlucose(10);
      expect(noInsulinCubit.state.medicalStatus, MedicalStatus.guidingInsulin);
    });
    test('2 lượt glucose-insulin', () {
      ///lượt 1
      noInsulinCubit.getCarbonhydrate(200);
      noInsulinCubit.takeGlucose(10);
      noInsulinCubit.getGuide();
      ///lượt 2
      noInsulinCubit.getCarbonhydrate(200);
      noInsulinCubit.takeGlucose(13);
      noInsulinCubit.getGuide();
      print(noInsulinCubit.state.regimen);
    });
    test('2 lượt glucose-insulin in ra glucose results', () {
      ///lượt 1
      noInsulinCubit.getCarbonhydrate(200);
      noInsulinCubit.takeGlucose(10);
      noInsulinCubit.getGuide();
      ///lượt 2
      noInsulinCubit.getCarbonhydrate(200);
      noInsulinCubit.takeGlucose(13);
      noInsulinCubit.getGuide();
      print(noInsulinCubit.state.regimen.medicalCheckGlucoses);
    });
    test('2 lượt glucose-insulin in ra insulin results', () {
      ///lượt 1
      noInsulinCubit.getCarbonhydrate(200);
      noInsulinCubit.takeGlucose(10);
      noInsulinCubit.getGuide();
      ///lượt 2
      noInsulinCubit.getCarbonhydrate(200);
      noInsulinCubit.takeGlucose(13);
      noInsulinCubit.getGuide();
      print(noInsulinCubit.state.regimen.medicalTakeInsulins);
    });
  });
}
