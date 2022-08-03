//Package imports:
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

//Project imports
import 'package:my_online_doctor/application/use_cases/patient_profile/get_patient_profile_use_case.dart';
import 'package:my_online_doctor/domain/models/profile/get_patient_profile_model.dart';
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';

part 'patient_profile_event.dart';
part 'patient_profile_state.dart';


///PatientProfileBloc: Here we would have the Profile domain logic.
class PatientProfileBloc extends Bloc<PatientProfileEvent, PatientProfileState> {

  // Here the StreamController can be a state or a DomainModel
  final _patientProfileStreamController = StreamController<GetPatientProfileModel?>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();
  final GetPatientProfileUseCaseContract _getPatientProfileUseCase = GetPatientProfileUseCaseContract.get();


 //Constructor
  //You have to declare the StateInitial as the first state
  PatientProfileBloc() : super(PatientProfileStateInitial()) {
    on<PatientProfileEventNavigateToWith>(_navigateToWithEventToState);
    on<PatientProfileEventFetchBasicData>(_getPatientProfileEventToState);

  }
  //Getters
  Stream<GetPatientProfileModel?> get streamPatientProfile => _patientProfileStreamController.stream;

  //Methods:
  ///This method is called when the event is [PatientProfileEventNavigateToWith]
  ///It navigates to the specified page.
  void _navigateToWithEventToState(PatientProfileEventNavigateToWith event, Emitter<PatientProfileState> emit) {

    _dispose();
    _navigatorManager.navigateToWithReplacement(event.routeName);
  }


  ///This method is called when the event is [PatientProfileEventFetchBasicData]
  ///It fetches the basic data of the patient.
  void _getPatientProfileEventToState(PatientProfileEventFetchBasicData event, Emitter<PatientProfileState> emit) async {

    emit(PatientProfileStateLoading());

    final response = await _getPatientProfileUseCase.run();

    if(response != null) {

      final patientProfile = getPatientProfileModelFromJson(response);

      _patientProfileStreamController.sink.add(patientProfile);

    } else{

      _patientProfileStreamController.sink.add(null);
    }
    emit(PatientProfileStateHideLoading());

  }


  //Private methods:

  void _dispose() {
    _patientProfileStreamController.close();
  }

}