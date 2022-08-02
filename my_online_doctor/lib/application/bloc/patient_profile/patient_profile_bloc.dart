//Package imports:
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

//Project imports
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';

part 'patient_profile_event.dart';
part 'patient_profile_state.dart';


///PatientProfileBloc: Here we would have the Profile domain logic.
class PatientProfileBloc extends Bloc<PatientProfileEvent, PatientProfileState> {

  // Here the StreamController can be a state or a DomainModel
  final _patientProfileStreamController = StreamController<bool>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();

 //Constructor
  //You have to declare the StateInitial as the first state
  PatientProfileBloc() : super(PatientProfileStateInitial()) {
    on<PatientProfileEventNavigateToWith>(_navigateToWithEventToState);

  }
  //Getters
  Stream<bool> get streamPatientProfile => _patientProfileStreamController.stream;

  //Methods:
  ///This method is called when the event is [PatientProfileEventNavigateToWith]
  ///It navigates to the specified page.
  void _navigateToWithEventToState(PatientProfileEventNavigateToWith event, Emitter<PatientProfileState> emit) {

    _dispose();
    _navigatorManager.navigateToWithReplacement(event.routeName);
  }


  //Private methods:

  void _dispose() {
    _patientProfileStreamController.close();
  }

}