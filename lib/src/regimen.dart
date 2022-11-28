// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:medical_trial/src/medical_action.dart';
import 'package:medical_trial/src/medical_check_glucose.dart';
import 'package:medical_trial/src/medical_take_insulin.dart';

class Regimen extends Equatable {
  double? currentInsulin = 5;
  List<dynamic>? medicalActions = <dynamic>[];
  List<MedicalCheckGlucose>? medicalCheckGlucoses = [];
  List<MedicalTakeInsulin>? medicalTakeInsulins = [];
  Regimen({
    this.currentInsulin,
    this.medicalActions,
    this.medicalCheckGlucoses,
    this.medicalTakeInsulins,
  });

  void addMedicalAction(dynamic medicalAction) {
    medicalActions?.add(medicalAction);
    if (medicalAction.runtimeType == MedicalCheckGlucose) {
      addMedicalCheckGlucose(medicalAction);
    } else if (medicalAction.runtimeType == MedicalCheckGlucose) {
      addMedicalTakeInsulin(medicalAction);
    }
  }

  void addMedicalCheckGlucose(MedicalCheckGlucose medicalCheckGlucose) {
    medicalCheckGlucoses?.add(medicalCheckGlucose);
  }

  void addMedicalTakeInsulin(dynamic medicalTakeInsulin) {
    medicalTakeInsulins?.add(medicalTakeInsulin);
  }

  @override
  List<Object?> get props => [
        this.medicalActions,
        this.medicalCheckGlucoses,
        this.medicalTakeInsulins,
        this.currentInsulin,
      ];
}
