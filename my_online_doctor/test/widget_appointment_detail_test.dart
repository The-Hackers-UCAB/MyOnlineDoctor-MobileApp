// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_online_doctor/application/bloc/appointment/appointment_bloc.dart';
import 'package:my_online_doctor/domain/models/appointment/get_appointment_model.dart';
import 'package:my_online_doctor/infrastructure/core/constants/text_constants.dart';
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/infrastructure/ui/appointment/appointment_detail_page.dart';

import 'object_mothers/appointment_object_mother.dart';

Widget createWidgetForTesting(Widget child) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  setUpAll(() {
    InjectionManager.setupInjectionsTesting();
  });

  testWidgets('El detalle de una cita agendada tiene el boton de aceptar cita',
      (tester) async {
    // Arrange
    final appointmentMock = AppointmentExamples.scheduledAppointment();
    // Act
    await tester.pumpWidget(createWidgetForTesting(
        AppointmentDetailPage(appointment: appointmentMock)));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text(TextConstant.rejectAppointment.text), findsOneWidget);
  });
}
