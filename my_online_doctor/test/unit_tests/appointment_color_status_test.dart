import 'package:flutter_test/flutter_test.dart';
import 'package:my_online_doctor/domain/services/appointment_status_color_service.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';

import '../object_mothers/appointment_object_mother.dart';


void main() {
  
  test('Completed Status test', ()  {
    
    String status = AppointmentExamples.getCompletedAppointment();

    expect(AppointmentStatusColorService.getAppointmentStatusColor(status), colorPrimary);

  });


  test('Initiated Status test', ()  {
    
    String status = AppointmentExamples.getInitiatedAppointment();

    expect(AppointmentStatusColorService.getAppointmentStatusColor(status), colorGreen);

  });


  test('Accepted Status test', ()  {
    
    String status = AppointmentExamples.getAcceptedAppointment();

    expect(AppointmentStatusColorService.getAppointmentStatusColor(status), colorGreen);

  });


  test('Scheduled Status test', ()  {
    
    String status = AppointmentExamples.getScheduledAppointment();

    expect(AppointmentStatusColorService.getAppointmentStatusColor(status), colorYellow);

  });

  test('Requested Status test', ()  {
    
    String status = AppointmentExamples.getRequestedAppointment();

    expect(AppointmentStatusColorService.getAppointmentStatusColor(status), colorYellow);

  });


  test('Rejected Status test', ()  {
    
    String status = AppointmentExamples.getRejectedAppointment();

    expect(AppointmentStatusColorService.getAppointmentStatusColor(status), colorError);

  });


  test('Cancelled Status test', ()  {
    
    String status = AppointmentExamples.getCancelledAppointment();

    expect(AppointmentStatusColorService.getAppointmentStatusColor(status), colorError);

  });

}