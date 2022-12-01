import 'package:medical_trial/medical_trial.dart';
import 'dart:core';

import 'package:medical_trial/src/medical_action.dart';
import 'package:medical_trial/src/medical_check_glucose.dart';

enum Medicine {
  GA,
  Bibi,
}

void main1() {
  // var awesome = Awesome();
  //print('awesome: ${awesome.isAwesome}');
  DateTime a = DateTime.now();
  print(a);
  print(a.millisecond);
  print(a.toString());
  print(a.toString() + ' hello');
  String b = Medicine.GA.toString();
  print(b.runtimeType);
  print(getfromString(b));
}

Medicine getfromString(String b) {
  final c = b.split('.');
  if (c[1] == 'GA')
    return Medicine.GA;
  else
    return Medicine.Bibi;
}

void main2() {
  DateTime timeset = DateTime.now();
  MedicalAction a = MedicalAction(time: timeset);

  MedicalCheckGlucose b = MedicalCheckGlucose(time: timeset, glucoseUI: 12);
  MedicalCheckGlucose c = MedicalCheckGlucose(time: timeset, glucoseUI: 13);

  print('Hello');
  print(c.runtimeType);
}

void main() {
  // Regimen exam = Regimen(currentInsulin: 10);
  // DateTime timeset = DateTime.now();
  // MedicalCheckGlucose c = MedicalCheckGlucose(time: timeset, glucoseUI: 12);
  // exam.addMedicalAction(c);
  // print(c);
  // print(exam.medicalActions?[0]);
  // dynamic timeA = DateTime(1999);
  // dynamic d = MedicalAction(time: timeA);
  // print(d.runtimeType);
  // print(d);
  
}
