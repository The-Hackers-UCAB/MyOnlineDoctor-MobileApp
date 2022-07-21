//Project imports:
part of 'appointment_request_bloc.dart';

//AppointmentRequestState: Here we define the states of the AppointmentRequestBloc.
abstract class AppointmentRequestState {}

class AppointmentRequestStateInitial extends AppointmentRequestState {}

class AppointmentRequestStateLoading extends AppointmentRequestState {}

class AppointmentRequestStateHideLoading extends AppointmentRequestState {}


