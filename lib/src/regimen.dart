import 'package:equatable/equatable.dart';
import 'package:medical_trial/src/medical_check_glucose.dart';

class Regimen extends Equatable {
  List<dynamic> medicalActions = [];
  List<dynamic> medicalCheckGlucoses = [];
  List<dynamic> medicalTakeInsulins = [];

  void addMedicalAction(dynamic medicalAction) {
    medicalActions.add(medicalAction);
    if (medicalActions.runtimeType == MedicalCheckGlucose) {
      addMedicalCheckGlucose(medicalAction);
    } else if (medicalActions.runtimeType == MedicalCheckGlucose) {
      addMedicalTakeInsulin(medicalAction);
    }
  }

  void addMedicalCheckGlucose(MedicalCheckGlucose medicalCheckGlucose) {
    medicalCheckGlucoses.add(medicalCheckGlucose);
  }

  void addMedicalTakeInsulin(dynamic medicalTakeInsulin) {
    medicalTakeInsulins.add(medicalTakeInsulin);
  }

  @override
  List<Object?> get props => [
        this.medicalActions,
        this.medicalCheckGlucoses,
        this.medicalTakeInsulins,
      ];
}

class RegimentType2NoInsulin extends Regimen {}
