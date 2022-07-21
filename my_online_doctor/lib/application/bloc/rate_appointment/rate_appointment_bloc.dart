//Package imports:
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_doctor/application/use_cases/appointments/rate_appointment_use_case.dart';
import 'package:my_online_doctor/domain/models/appointment/rate_appointment_model.dart';
import 'package:my_online_doctor/infrastructure/core/constants/text_constants.dart';

//Project imports:
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';
import 'package:my_online_doctor/infrastructure/ui/components/dialog_component.dart';
part 'rate_appointment_event.dart';
part 'rate_appointment_state.dart';


///RateAppointmentBloc: Here we would have the RateAppointment domain logic.
class RateAppointmentBloc extends Bloc<RateAppointmentEvent, RateAppointmentState> {

  //Here the StreamController can be a state or a DomainModel
  final _rateAppointmentStreamController = StreamController<bool>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();
  final RateAppointmentsUseCaseContract _rateAppointmentUseCase = RateAppointmentsUseCaseContract.get();


  //Constructor
 //You have to declare the StateInitial as the first state
  RateAppointmentBloc() : super(RateAppointmentStateInitial()) {
    on<RateAppointmentEventFetchBasicData>(_fetchBasicRateAppointmentDataEventToState);
    on<RateAppointmentEventNavigateToWith>(_navigateToWithEventToState);
    on<RateAppointmentEventRated>(_ratedAppointmentEventToState);

  }


  //Getters
  Stream<bool> get streamRateAppointment => _rateAppointmentStreamController.stream;


  //Methods:

  ///This method is called when the event is [RateAppointmentEventFetchBasicData]
  ///It fetches the basic data of the RateAppointment page.
  ///It is called when the event is [RateAppointmentEventFetchBasicData]
  void _fetchBasicRateAppointmentDataEventToState(RateAppointmentEventFetchBasicData event, Emitter<RateAppointmentState> emit) async {

    emit(RateAppointmentStateLoading());

    _rateAppointmentStreamController.sink.add(true);

    emit(RateAppointmentStateHideLoading());

  }


  ///This method is called when the event is [RateAppointmentEventNavigateToWith]
  ///It navigates to the page with the given [routeName] and [arguments]
  void _navigateToWithEventToState(RateAppointmentEventNavigateToWith event, Emitter<RateAppointmentState> emit) async {

    emit(RateAppointmentStateLoading());

    _dispose();
    _navigatorManager.navigateToWithReplacement(event.routeName);

    emit(RateAppointmentStateHideLoading());

  }


  ///This method is called when the event is [RateAppointmentEventRated]
  ///It requests the appointment.
  void _ratedAppointmentEventToState(RateAppointmentEventRated event, Emitter<RateAppointmentState> emit) async {

    emit(RateAppointmentStateLoading());

    final response = await _rateAppointmentUseCase.run(event.appointment);

    if(response != null) {

      await showDialog(
        context: event.context,
          builder: (BuildContext superContext) => DialogComponent(
              textTitle: TextConstant.successTitle.text,
              textQuestion: TextConstant.successRateAppointment.text,
            )
        );

    }

    _dispose();

    _navigatorManager.navigateToWithReplacement('/bottom_menu');

    emit(RateAppointmentStateHideLoading());

  }




  //Private methods:

  void _dispose(){
    _rateAppointmentStreamController.close();
  }

}