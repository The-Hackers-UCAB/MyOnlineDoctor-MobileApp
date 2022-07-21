import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'request_appointment_event.dart';
part 'request_appointment_state.dart';

class RequestAppointmentBloc extends Bloc<RequestAppointmentEvent, RequestAppointmentState> {
  RequestAppointmentBloc() : super(RequestAppointmentInitial()) {
    on<RequestAppointmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
