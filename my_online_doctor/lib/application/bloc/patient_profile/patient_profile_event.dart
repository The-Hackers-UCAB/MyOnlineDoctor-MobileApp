//Project imports:
part of 'patient_profile_bloc.dart';

///PatientProfileEvent: Here we define the events of the ProfileBloc.
abstract class PatientProfileEvent {}


class PatientProfileEventFetchBasicData extends PatientProfileEvent {}

class PatientProfileEventNavigateTo extends PatientProfileEvent {
  final String routeName;
  final Object? arguments;
  PatientProfileEventNavigateTo(this.routeName, {this.arguments});
}
