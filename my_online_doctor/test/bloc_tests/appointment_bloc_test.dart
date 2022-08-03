import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_online_doctor/application/bloc/appointment/appointment_bloc.dart';
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';

void main() {
  setUpAll(() {
    InjectionManager.setupInjectionsTesting();
  });

  blocTest(
    'Appointment bloc',
    build: () {
      return AppointmentBloc();
    },
    act: (AppointmentBloc bloc) {
      bloc.add(AppointmentEventFetchBasicData());
    },
    expect: () => [
      isInstanceOf<AppointmentStateLoading>(),
      isInstanceOf<AppointmentStateHideLoading>()
    ],
  );
}