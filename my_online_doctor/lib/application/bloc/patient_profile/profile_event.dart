//Project imports:
part of 'profile_bloc.dart';

///ProfileEvent: Here we define the events of the ProfileBloc.
abstract class ProfileEvent {}


class ProfileEventFetchBasicData extends ProfileEvent {}

class ProfileEventNavigateToWith extends ProfileEvent {
  final String routeName;
  ProfileEventNavigateToWith(this.routeName);
}
