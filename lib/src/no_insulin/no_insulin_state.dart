// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'no_insulin_cubit.dart';

class NoInsulinState extends Equatable {
  Regimen regimen;
  NoInsulinState(
    this.regimen,
  );

  @override
  List<Object> get props => [
    this.regimen,
  ];
}

