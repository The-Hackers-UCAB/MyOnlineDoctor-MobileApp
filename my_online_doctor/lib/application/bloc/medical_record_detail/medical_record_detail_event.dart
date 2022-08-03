//Project imports:
part of 'medical_record_detail_bloc.dart';

///MedicalRecordDetailEvent: Here we define the events of the MedicalRecordDetailBloc.
abstract class MedicalRecordDetailEvent {}

class MedicalRecordDetailEventFetchBasicData extends MedicalRecordDetailEvent {
  final GetMedicalRecordModel MedicalRecord;
  MedicalRecordDetailEventFetchBasicData(this.MedicalRecord);
}

class MedicalRecordDetailEventNavigateToWith extends MedicalRecordDetailEvent {
  final String routeName;
  final Object? arguments;
  MedicalRecordDetailEventNavigateToWith(this.routeName, {this.arguments});
}
