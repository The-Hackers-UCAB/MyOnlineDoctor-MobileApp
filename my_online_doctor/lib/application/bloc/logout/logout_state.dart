//Project imports:
part of 'logout_bloc.dart';

//LogoutState: Here we define the states of the LoginBloc.
abstract class LogoutState {}

class LogoutStateInitial extends LogoutState {}

class LogoutStateLoading extends LogoutState {}

class LogoutStateHideLoading extends LogoutState {}

class LogoutStateSuccess extends LogoutState {}

