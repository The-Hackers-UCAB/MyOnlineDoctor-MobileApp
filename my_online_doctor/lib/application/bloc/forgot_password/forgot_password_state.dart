//Project imports:
part of 'forgot_password_bloc.dart';

//ForgotPasswordState: Here we define the states of the ForgotPasswordBloc.
abstract class ForgotPasswordState {}

class ForgotPasswordStateInitial extends ForgotPasswordState {}

class ForgotPasswordStateLoading extends ForgotPasswordState {}

class ForgotPasswordStateHideLoading extends ForgotPasswordState {}

class ForgotPasswordStateSuccess extends ForgotPasswordState {}

