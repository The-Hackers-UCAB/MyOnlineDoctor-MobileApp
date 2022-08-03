import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_doctor/infrastructure/core/constants/text_constants.dart';
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';
import 'package:my_online_doctor/infrastructure/ui/components/dialog_component.dart';

import '../../../domain/models/appointment/get_medical_record_model.dart';
part 'medical_record_detail_event.dart';
part 'medical_record_detail_state.dart';

///MedicalRecordDetailBloc: Here we would have the MedicalRecordDetailDetail domain logic.
class MedicalRecordDetailBloc
    extends Bloc<MedicalRecordDetailEvent, MedicalRecordDetailState> {
  //Here the StreamController can be a state or a DomainModel
  final _MedicalRecordDetailStreamController =
      StreamController<GetMedicalRecordModel>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager =
      NavigatorServiceContract.get();

  //Constructor
  //You have to declare the StateInitial as the first state
  MedicalRecordDetailBloc() : super(MedicalRecordDetailStateInitial()) {
    on<MedicalRecordDetailEventFetchBasicData>(
        _fetchBasicAppointmentDataEventToState);
    on<MedicalRecordDetailEventNavigateToWith>(_navigateToWithEventToState);
  }

  //Variables
  late GetMedicalRecordModel _medicalRecordDetailModel;

  //Getters
  Stream<GetMedicalRecordModel> get streamMedicalRecordDetail =>
      _MedicalRecordDetailStreamController.stream;

  //Setters

  //Methods

  ///This method is called when the event is [MedicalRecordDetailEventFetchBasicData]
  ///It will fetch the basic data of the appointment and then it will dispatch the [MedicalRecordDetailEventFetchBasicData] event
  ///to the state.
  void _fetchBasicAppointmentDataEventToState(
      MedicalRecordDetailEventFetchBasicData event,
      Emitter<MedicalRecordDetailState> emit) {
    emit(MedicalRecordDetailStateLoading());

    _medicalRecordDetailModel = event.MedicalRecord;

    _MedicalRecordDetailStreamController.add(_medicalRecordDetailModel);

    emit(MedicalRecordDetailStateHideLoading());
  }

  ///This method is called when the event is [AppointmentEventDetailNavigateToWith]
  ///It navigates to the specified page.
  void _navigateToWithEventToState(MedicalRecordDetailEventNavigateToWith event,
      Emitter<MedicalRecordDetailState> emit) {
    _dispose();
    _navigatorManager.navigateToWithReplacement(event.routeName,
        arguments: event.arguments);
  }

  ///This method is called when the event is [MedicalRecordDetailEventCancelled]
  ///It cancels the appointment.

  //Private methods

  void _dispose() {
    _MedicalRecordDetailStreamController.close();
  }
}
