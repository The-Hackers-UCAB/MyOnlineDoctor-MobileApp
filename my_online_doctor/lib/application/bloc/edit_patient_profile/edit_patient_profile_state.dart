//Project imports:
part of 'edit_patient_profile_bloc.dart';

//EditPatientProfileState: Here we define the states of the ProfileBloc.
abstract class EditPatientProfileState {}

class EditPatientProfileStateInitial extends EditPatientProfileState {}

class EditPatientProfileStateLoading extends EditPatientProfileState {}

class EditPatientProfileStateHideLoading extends EditPatientProfileState {}

class EditPatientProfileStateSuccess extends EditPatientProfileState {}

