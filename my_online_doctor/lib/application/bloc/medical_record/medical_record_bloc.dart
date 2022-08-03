//Package imports:
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_doctor/application/use_cases/medical_record/get_patient_medical_record_use_case.dart';

//Project imports
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';
part 'medical_record_event.dart';
part 'medical_record_state.dart';


///MedicalRecordBloc: Here we would have the Login domain logic.
class MedicalRecordBloc extends Bloc<MedicalRecordEvent, MedicalRecordState> {

  //Here the StreamController can be a state or a DomainModel
  final _medicalRecordStreamController = StreamController<bool>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();
  final GetPatientMedicalRecordUseCaseContract _getPatientMedicalRecordUseCase = GetPatientMedicalRecordUseCaseContract.get();



 //Constructor
  //You have to declare the StateInitial as the first state
  MedicalRecordBloc() : super(MedicalRecordStateInitial()) {
    on<MedicalRecordEventNavigateToWith>(_navigateToWithEventToState);
    on<MedicalRecordEventFetchBasicData>(_fetchBasicDataEventToState);

  }


  //Getters
  Stream<bool> get streamLogin => _medicalRecordStreamController.stream;

  //Methods:


  ///This method is called when the event is [MedicalRecordEventNavigateTo]
  ///It navigates to the specified page.
  void _navigateToWithEventToState(MedicalRecordEventNavigateToWith event, Emitter<MedicalRecordState> emit) {

    _dispose();
    _navigatorManager.navigateToWithReplacement(event.routeName);
  }


  ///This method is called when the event is [MedicalRecordEventFetchBasicData]
  ///It fetches the basic data.
  ///It is a use case that is called from the [MedicalRecordBloc]
  void _fetchBasicDataEventToState(MedicalRecordEventFetchBasicData event, Emitter<MedicalRecordState> emit) async {

    emit(MedicalRecordStateLoading());

    final response = await _getPatientMedicalRecordUseCase.run(); //TODO: Add model
    
    //TODO: Here we would have the domain logic to fetch the basic data.

    emit(MedicalRecordStateHideLoading());
  }



  //Private methods:
  
  void _dispose() {
    _medicalRecordStreamController.close();
  }


}