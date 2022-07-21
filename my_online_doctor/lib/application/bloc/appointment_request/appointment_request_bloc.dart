//Package imports:
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_doctor/domain/models/appointment/request_appointment_model.dart';
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';

//Project imports:
part 'appointment_request_event.dart';
part 'appointment_request_state.dart';

///AppointmentRequestBloc: Here we would have the AppointmentRequestRequest domain logic.
class AppointmentRequestBloc extends Bloc<AppointmentRequestEvent, AppointmentRequestState> {


  //Here the StreamController can be a state or a DomainModel
  final _appointmentRequestStreamController = StreamController<RequestAppointmentModel>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();


  //Constructor
  AppointmentRequestBloc(): super(AppointmentRequestStateInitial()){
    on<AppointmentRequestEventFetchBasicData>(_fetchBasicDataEventToState);
    on<AppointmentRequestEventNavigateTo>(_navigateToEventToState);
    on<AppointmentRequestEventRequested>(_requestedEventToState);
  }


  //Getters
  Stream<RequestAppointmentModel> get streamAppointmentRequest => _appointmentRequestStreamController.stream;

  //Methods:

  ///This method is called when the event is [AppointmentRequestEventFetchBasicData]
  ///It fetches the basic data of the appointment request.
  void _fetchBasicDataEventToState(AppointmentRequestEventFetchBasicData event, Emitter<AppointmentRequestState> emit)  async {

    emit(AppointmentRequestStateLoading());

    _appointmentRequestStreamController.sink.add(event.appointment);


    emit(AppointmentRequestStateHideLoading());


  }


  ///This method is called when the event is [AppointmentRequestEventNavigateTo]
  ///It navigates to the specified route.
  ///It takes the route name and the arguments as parameters.
  void _navigateToEventToState(AppointmentRequestEventNavigateTo event, Emitter<AppointmentRequestState> emit)  async {

    _dispose();
    _navigatorManager.navigateTo(event.routeName, arguments: event.arguments);

  }


  ///This method is called when the event is [AppointmentRequestEventRequested]
  ///It requests the appointment.
  ///It takes the appointment request model as parameter.
  void _requestedEventToState(AppointmentRequestEventRequested event, Emitter<AppointmentRequestState> emit)  async {

    emit(AppointmentRequestStateLoading());

    emit(AppointmentRequestStateHideLoading());

  }



  //Private methods:

  //Dispose the stream controllers
  void _dispose() {
    _appointmentRequestStreamController.close();
  }


} 