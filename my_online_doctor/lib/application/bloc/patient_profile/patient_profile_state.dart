//Project imports:
part of 'patient_profile_bloc.dart';

//PatientProfileState: Here we define the states of the ProfileBloc.
abstract class PatientProfileState {}

class PatientProfileStateInitial extends PatientProfileState {}

class PatientProfileStateLoading extends PatientProfileState {}

class PatientProfileStateHideLoading extends PatientProfileState {}

class PatientProfileStateSuccess extends PatientProfileState {}

