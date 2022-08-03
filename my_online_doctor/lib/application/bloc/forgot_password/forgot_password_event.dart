//Project imports:
part of 'forgot_password_bloc.dart';

///ForgotPasswordEvent: Here we define the events of the ForgotPasswordBloc.
abstract class ForgotPasswordEvent {}


class ForgotPasswordEventFetchBasicData extends ForgotPasswordEvent {}

class ForgotPasswordEventNavigateTo extends ForgotPasswordEvent {
  final String routeName;
  ForgotPasswordEventNavigateTo(this.routeName);
}


class ForgotPasswordEventRecoverPasswordPatient extends ForgotPasswordEvent {


  ForgotPasswordEventRecoverPasswordPatient();
}
