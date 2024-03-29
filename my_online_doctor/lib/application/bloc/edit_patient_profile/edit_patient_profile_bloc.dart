//Package imports:
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_doctor/application/use_cases/patient_profile/update_patient_profile_sue_case.dart';
import 'package:my_online_doctor/domain/models/profile/get_patient_profile_model.dart';

//Project imports
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';

part 'edit_patient_profile_event.dart';
part 'edit_patient_profile_state.dart';


///EditPatientProfileBloc: Here we would have the Profile domain logic.
class EditPatientProfileBloc extends Bloc<EditPatientProfileEvent, EditPatientProfileState> {

  // Here the StreamController can be a state or a DomainModel
  final _editPatientProfileStreamController = StreamController<GetPatientProfileModel>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();
  final UpdatePatientProfileUseCaseContract _updatePatientProfileUseCase = UpdatePatientProfileUseCaseContract.get();


 //Constructor
  //You have to declare the StateInitial as the first state
  EditPatientProfileBloc() : super(EditPatientProfileStateInitial()) {
    on<EditPatientProfileEventFetchBasicData>(_getPatientProfileEventToState);
    on<EditPatientProfileEventNavigateToWith>(_navigateToWithEventToState);
    on<EditPatientProfileEventUpdatePatientProfile>(_editPatientProfileEventToState);  
  }


  //Getters
  Stream<GetPatientProfileModel> get streamEditPatientProfile => _editPatientProfileStreamController.stream;

  //Methods:


  ///This method is called when the event is [EditPatientProfileEventFetchBasicData]
  ///It fetches the basic data of the patient.
  void _getPatientProfileEventToState(EditPatientProfileEventFetchBasicData event, Emitter<EditPatientProfileState> emit) async {

    emit(EditPatientProfileStateLoading());

    _editPatientProfileStreamController.sink.add(event.patient);

    emit(EditPatientProfileStateHideLoading());
  }


  ///This method is called when the event is [EditPatientProfileEventNavigateToWith]
  ///It navigates to the specified page.
  void _navigateToWithEventToState(EditPatientProfileEventNavigateToWith event, Emitter<EditPatientProfileState> emit) {

    _dispose();
    _navigatorManager.navigateToWithReplacement(event.routeName);
  }


  ///This method is called when the event is [EditPatientProfileEventUpdatePatientProfile]
  ///It updates the patient profile.
  void _editPatientProfileEventToState(EditPatientProfileEventUpdatePatientProfile event, Emitter<EditPatientProfileState> emit) async {
    
    emit(EditPatientProfileStateLoading());

    final response = await _updatePatientProfileUseCase.run(); //TODO: Add Model

    //TODO: Here we would have the logic to update the patient profile.

    emit(EditPatientProfileStateHideLoading());

  }


  //Private methods:

  void _dispose() {
    _editPatientProfileStreamController.close();
  }

}