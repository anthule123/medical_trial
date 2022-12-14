// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:medical_trial/src/medical_action.dart';
import 'package:medical_trial/src/medical_check_glucose.dart';
import 'package:medical_trial/src/medical_take_insulin.dart';

List<dynamic> dylist = [];

class Regimen extends Equatable {
  double? currentInsulin = 5;
  List<dynamic> medicalActions;
  List<MedicalCheckGlucose> medicalCheckGlucoses;
  List<MedicalTakeInsulin> medicalTakeInsulins;

  Regimen({
    this.currentInsulin = 5,
    required this.medicalActions,
    required this.medicalCheckGlucoses,
    required this.medicalTakeInsulins,
  });

  void addMedicalAction(dynamic medicalAction) {
    medicalActions.add(medicalAction.clone());
    if (medicalAction.runtimeType == MedicalCheckGlucose) {
      addMedicalCheckGlucose(medicalAction);
    } else if (medicalAction.runtimeType == MedicalTakeInsulin) {
      addMedicalTakeInsulin(medicalAction);
    }
  }

  void addMedicalCheckGlucose(MedicalCheckGlucose medicalCheckGlucose) {
    medicalCheckGlucoses.add(medicalCheckGlucose.clone());
  }

  void addMedicalTakeInsulin(MedicalTakeInsulin medicalTakeInsulin) {
    medicalTakeInsulins.add(medicalTakeInsulin.clone());
  }

  @override
  String toString() {
    dynamic medicalActions_str = medicalActions.toString();
    return 'Regimen ${medicalActions_str}';
  }

  @override
  List<Object?> get props => [
        this.medicalActions,
        this.medicalCheckGlucoses,
        this.medicalTakeInsulins,
        this.currentInsulin,
      ];
  Regimen clone() {
    return Regimen(
      medicalActions: [for (dynamic x in medicalActions) x.clone()],
      medicalCheckGlucoses: [
        for (MedicalCheckGlucose x in medicalCheckGlucoses) x.clone()
      ],
      medicalTakeInsulins: [
        for (MedicalTakeInsulin x in medicalTakeInsulins) x.clone()
      ],
      currentInsulin: currentInsulin,
    );
  }
}

// Regimen InitialRegimen() {
//   List medicalActions = <dynamic>[];
//   List<MedicalCheckGlucose> medicalCheckGlucoses = <MedicalCheckGlucose>[];
//   List<MedicalTakeInsulin> medicalTakeInsulins = <MedicalTakeInsulin>[];
//   return Regimen(
//     medicalActions: [...medicalActions],
//     medicalCheckGlucoses: [...medicalCheckGlucoses],
//     medicalTakeInsulins: [...medicalTakeInsulins],
//   );
// }

Regimen InitialRegimen() {
  return Regimen(
    medicalActions: [],
    medicalCheckGlucoses: [],
    medicalTakeInsulins: [],
  );
}
