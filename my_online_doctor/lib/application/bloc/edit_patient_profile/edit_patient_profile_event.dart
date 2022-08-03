//Project imports:
part of 'edit_patient_profile_bloc.dart';

///EditPatientProfileEvent: Here we define the events of the ProfileBloc.
abstract class EditPatientProfileEvent {}


class EditPatientProfileEventFetchBasicData extends EditPatientProfileEvent {
  final GetPatientProfileModel patient;

  EditPatientProfileEventFetchBasicData(this.patient);
}

class EditPatientProfileEventNavigateToWith extends EditPatientProfileEvent {
  final String routeName;
  EditPatientProfileEventNavigateToWith(this.routeName);
}


class EditPatientProfileEventUpdatePatientProfile extends EditPatientProfileEvent {
  // final PatientProfile patientProfile;
  EditPatientProfileEventUpdatePatientProfile();
}
