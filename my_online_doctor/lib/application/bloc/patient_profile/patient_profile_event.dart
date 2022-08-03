//Project imports:
part of 'patient_profile_bloc.dart';

///PatientProfileEvent: Here we define the events of the ProfileBloc.
abstract class PatientProfileEvent {}


class PatientProfileEventFetchBasicData extends PatientProfileEvent {}

class PatientProfileEventNavigateToWith extends PatientProfileEvent {
  final String routeName;
  PatientProfileEventNavigateToWith(this.routeName);
}
