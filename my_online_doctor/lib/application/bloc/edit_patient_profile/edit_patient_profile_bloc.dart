//Package imports:
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

//Project imports
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';

part 'edit_patient_profile_event.dart';
part 'edit_patient_profile_state.dart';


///EditPatientProfileBloc: Here we would have the Profile domain logic.
class EditPatientProfileBloc extends Bloc<EditPatientProfileEvent, EditPatientProfileState> {

  // Here the StreamController can be a state or a DomainModel
  final _editPatientProfileStreamController = StreamController<bool>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();

 //Constructor
  //You have to declare the StateInitial as the first state
  EditPatientProfileBloc() : super(EditPatientProfileStateInitial()) {
    on<EditPatientProfileEventNavigateToWith>(_navigateToWithEventToState);

  }
  //Getters
  Stream<bool> get streamEditPatientProfile => _editPatientProfileStreamController.stream;

  //Methods:
  ///This method is called when the event is [EditPatientProfileEventNavigateToWith]
  ///It navigates to the specified page.
  void _navigateToWithEventToState(EditPatientProfileEventNavigateToWith event, Emitter<EditPatientProfileState> emit) {

    _dispose();
    _navigatorManager.navigateToWithReplacement(event.routeName);
  }


  //Private methods:

  void _dispose() {
    _editPatientProfileStreamController.close();
  }

}