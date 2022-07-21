//Package imports:
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_doctor/application/use_cases/appointments/request_appointment_use_case.dart';
import 'package:my_online_doctor/domain/models/appointment/request_appointment_model.dart';
import 'package:my_online_doctor/infrastructure/core/constants/text_constants.dart';
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';
import 'package:my_online_doctor/infrastructure/ui/components/dialog_component.dart';

//Project imports:
part 'appointment_request_event.dart';
part 'appointment_request_state.dart';

///AppointmentRequestBloc: Here we would have the AppointmentRequestRequest domain logic.
class AppointmentRequestBloc extends Bloc<AppointmentRequestEvent, AppointmentRequestState> {


  //Here the StreamController can be a state or a DomainModel
  final _appointmentRequestStreamController = StreamController<bool>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();
  final RequestAppointmentsUseCaseContract _requestAppointmentUseCase = RequestAppointmentsUseCaseContract.get();


  //Constructor
  AppointmentRequestBloc(): super(AppointmentRequestStateInitial()){
    on<AppointmentRequestEventFetchBasicData>(_fetchBasicDataEventToState);
    on<AppointmentRequestEventNavigateTo>(_navigateToEventToState);
    on<AppointmentRequestEventRequested>(_requestedEventToState);
  }


  //Getters
  Stream<bool> get streamAppointmentRequest => _appointmentRequestStreamController.stream;

  //Methods:

  ///This method is called when the event is [AppointmentRequestEventFetchBasicData]
  ///It fetches the basic data of the appointment request.
  void _fetchBasicDataEventToState(AppointmentRequestEventFetchBasicData event, Emitter<AppointmentRequestState> emit)  async {

    emit(AppointmentRequestStateLoading());

    _appointmentRequestStreamController.sink.add(true);


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

    if(!_validateAppointmentRequest(event.appointment, event.context)){
      emit(AppointmentRequestStateHideLoading());
      _appointmentRequestStreamController.sink.add(false);
      return;

    }


    final response = await _requestAppointmentUseCase.run(event.appointment);

    if(response != null) {

      await showDialog(
        context: event.context,
          builder: (BuildContext superContext) => DialogComponent(
              textTitle: TextConstant.successTitle.text,
              textQuestion: TextConstant.successRequestAppointment.text,
            )
        );

    }

    emit(AppointmentRequestStateHideLoading());

    _dispose();

    // ignore: use_build_context_synchronously
    Navigator.of(event.context).pop();

  }



  //Private methods:

  ///This method is called when the event is [AppointmentRequestEventRequested]
  ///It validates the appointment request.
  ///It takes the appointment request model as parameter.
  bool _validateAppointmentRequest(RequestAppointmentModel event, BuildContext context) {

    if(event.description == '') {
      _showDialog(TextConstant.errorTitle.text, TextConstant.errorDescriptionRequest.text, context);
      return false;
    }

    return true;
  }



  //Dispose the stream controllers
  void _dispose() {
    _appointmentRequestStreamController.close();
  }


  //To show the dialog:
  void _showDialog(String textTitle, String textQuestion, BuildContext newContext) async {

    return await showDialog(
        context: newContext,
        builder: (BuildContext dialogContext) => Builder(
          builder: (superContext) {
            return DialogComponent(
              textTitle: textTitle,
              textQuestion: textQuestion,
            );
          }
        ));

  }


} 