part of 'request_appointment_bloc.dart';

@immutable
abstract class RequestAppointmentState {}

class RequestAppointmentInitial extends RequestAppointmentState {}

class RequestAppointmentStateLoading extends RequestAppointmentState {}

class RequestAppointmentStateHideLoading extends RequestAppointmentState {}




// class RequestAppointmentDayCompleted extends RequestAppointmentState {} 

// este estado lo pense como para que despues de darle al boton de solicitar cita
// aparezca una ventana emergente por encima de la vista con los datos que selecciono
// para que el usuario lo pueda volver a ver y confirme si son los datos correctos 
// antes de mandarla 

