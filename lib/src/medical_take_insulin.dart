// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:medical_trial/src/medical_action.dart';

enum InsulinType {
  Glargine,
  Actrapid,
  NPH,
}

class MedicalTakeInsulin extends MedicalAction {
  InsulinType insulinType;
  double insulinUI;
  MedicalTakeInsulin({
    required this.insulinType,
    required super.time,
    required this.insulinUI,
  });

  List<Object?> get props => [this.time, this.insulinType, this.insulinUI];
  MedicalTakeInsulin clone() {
    return MedicalTakeInsulin(
      insulinType: insulinType,
      time: time,
      insulinUI: insulinUI,
    );
  }
}
