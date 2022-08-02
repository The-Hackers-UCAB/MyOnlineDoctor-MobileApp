//Flutter imports:
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

//Project imports:
import 'package:my_online_doctor/infrastructure/core/navigator_manager.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';


///ForgotPasswordBloc: Here we would have the ForgotPassword domain logic.
class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {

  //Here the StreamController can be a state or a DomainModel
  final _forgotPasswordStreamController = StreamController<bool>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();



 //Constructor
  //You have to declare the StateInitial as the first state
  ForgotPasswordBloc() : super(ForgotPasswordStateInitial()) {
    on<ForgotPasswordEventNavigateTo>(_navigateToEventToState);
    on<ForgotPasswordEventRecoverPasswordPatient>(_recoverPasswordPatientEventToState);
  }


  //Getters
  Stream<bool> get streamForgotPassword => _forgotPasswordStreamController.stream;


  //Methods:


  ///This method is called when the event is [ForgotPasswordEventNavigateTo]
  ///It navigates to the specified route.
  void _navigateToEventToState(ForgotPasswordEventNavigateTo event, Emitter<ForgotPasswordState> emit) async {
    _dispose();
    _navigatorManager.navigateTo(event.routeName);
  }


  ///This method is called when the event is [ForgotPasswordEventRecoverPasswordPatient]
  ///It recovers the password of the patient.
  void _recoverPasswordPatientEventToState(ForgotPasswordEventRecoverPasswordPatient event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordStateLoading());

    //TODO: Implement the use case.

    emit(ForgotPasswordStateHideLoading());
  }


  //Private methods:

  //To dispose the stream:
  void _dispose() {
    _forgotPasswordStreamController.close();
  }


}