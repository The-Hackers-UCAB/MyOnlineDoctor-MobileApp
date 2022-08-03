//Project imports:
part of 'medical_record_detail_bloc.dart';

//MedicalRecordDetailState: Here we define the states of the MedicalRecordDetailBloc.
abstract class MedicalRecordDetailState {}

class MedicalRecordDetailStateInitial extends MedicalRecordDetailState {}

class MedicalRecordDetailStateLoading extends MedicalRecordDetailState {}

class MedicalRecordDetailStateHideLoading extends MedicalRecordDetailState {}
