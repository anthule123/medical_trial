import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_trial/src/medical_check_glucose.dart';
import 'package:medical_trial/src/medical_take_insulin.dart';
import 'package:medical_trial/src/regimen.dart';

part 'no_insulin_state.dart';

class NoInsulinCubit extends Cubit<NoInsulinState> {
  NoInsulinCubit() : super(NoInsulinState(InitialRegimen()));
  dynamic guide;
  double currentInsulin = 0;
  String notice = '';
  void getCarbonhydrate(double cho) {
    currentInsulin = cho / 15;
    guide = MedicalTakeInsulin(
      insulinType: InsulinType.Actrapid,
      time: DateTime.now(),
      insulinUI: currentInsulin,
    );
  }

  void getGuide() {
    guide.time = DateTime.now();
    state.regimen.addMedicalAction(guide);
  }

  void takeGlucose(double glucose) {
    //Nhận kết quả glucose của bệnh nhân
    MedicalCheckGlucose medicalCheckGlucose = MedicalCheckGlucose(
      time: DateTime.now(),
      glucoseUI: glucose,
    );
    if (3.9 <= glucose && glucose <= 8.3) {
      notice = 'Duy trì ${currentInsulin} UI Actrapid';
    } else if (8.3 <= glucose && glucose <= 11.1) {
      currentInsulin += 2;
      notice = 'Tiêm ${this.currentInsulin} UI Actrapid';
    } else if (11.1<= glucose) {
      currentInsulin += 4;
      notice = 'Tiêm ${this.currentInsulin} UI Actrapid';
    }
  }
}
