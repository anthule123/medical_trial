import 'package:medical_trial/src/medical_action.dart';

class MedicalCheckGlucose extends MedicalAction {
  double glucoseUI = 0;
  MedicalCheckGlucose({required super.time, required glucoseUI});
  @override
  List<Object?> get props => [this.time, this.glucoseUI];
  
}
