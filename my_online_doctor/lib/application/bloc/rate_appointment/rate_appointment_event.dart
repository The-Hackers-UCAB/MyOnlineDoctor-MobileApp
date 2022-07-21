//Project imports:
part of 'rate_appointment_bloc.dart';

///RateAppointmentEvent: Here we define the events of the RateAppointmentBloc.
abstract class RateAppointmentEvent {}


class RateAppointmentEventFetchBasicData extends RateAppointmentEvent {}

class RateAppointmentEventNavigateToWith extends RateAppointmentEvent {
  final String routeName;
  RateAppointmentEventNavigateToWith(this.routeName);
}


class RateAppointmentEventRated extends RateAppointmentEvent {
  final RateAppointmentModel appointment;
  final BuildContext context;

  RateAppointmentEventRated(this.appointment, this.context);
}
