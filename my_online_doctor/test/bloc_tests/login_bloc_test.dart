import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_online_doctor/application/bloc/login/login_bloc.dart';
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';

import '../object_mothers/login_patient_object_mother.dart';

void main() {
  setUpAll(() {
    InjectionManager.setupInjectionsTesting();
  });

  blocTest(
    'Appointment bloc',
    build: () {
      return LoginBloc();
    },
    act: (LoginBloc bloc) {
      bloc.add(
          LoginEventLoginPatient(LoginPatientExample.loginPatient(), true));
    },
    expect: () => [
      isInstanceOf<LoginStateLoading>(),
      isInstanceOf<LoginStateHideLoading>()
    ],
  );
}
