//Project imports:
part of 'appointment_request_bloc.dart';

///AppointmentRequestEvent: Here we define the events of the AppointmentRequestBloc.
abstract class AppointmentRequestEvent {}


class AppointmentRequestEventFetchBasicData extends AppointmentRequestEvent {}

class AppointmentRequestEventNavigateTo extends AppointmentRequestEvent {
  final String routeName;
  final Object? arguments;
  AppointmentRequestEventNavigateTo(this.routeName, {this.arguments});

}

class AppointmentRequestEventRequested extends AppointmentRequestEvent {
  final RequestAppointmentModel appointment;
  final BuildContext context;

  AppointmentRequestEventRequested(this.appointment, this.context);
}
