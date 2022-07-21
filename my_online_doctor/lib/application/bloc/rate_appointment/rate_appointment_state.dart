//Project imports:
part of 'rate_appointment_bloc.dart';

//RateAppointmentState: Here we define the states of the RateAppointmentBloc.
abstract class RateAppointmentState {}

class RateAppointmentStateInitial extends RateAppointmentState {}

class RateAppointmentStateLoading extends RateAppointmentState {}

class RateAppointmentStateHideLoading extends RateAppointmentState {}

class RateAppointmentStateSuccess extends RateAppointmentState {}

