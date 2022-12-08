import 'package:medical_trial/src/no_insulin/no_insulin_cubit.dart';
import 'package:medical_trial/src/regimen.dart';

void main() {
  Regimen r0 = InitialRegimen();
  NoInsulinCubit noInsulinCubit = NoInsulinCubit();
  print(noInsulinCubit.state.regimen);
}
