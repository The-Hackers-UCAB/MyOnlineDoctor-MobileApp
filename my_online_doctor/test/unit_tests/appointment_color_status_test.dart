import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_online_doctor/domain/services/appointment_status_color_service.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';

import '../object_mothers/appointment_object_mother.dart';


void main() {
  
  test('Completed Status test', ()  {
    
    //Arrange
    String status = AppointmentExamples.getCompletedAppointment();

    //Act
    Color result = AppointmentStatusColorService.getAppointmentStatusColor(status);

    //Assert
    expect(result, colorPrimary);

  });


  test('Initiated Status test', ()  {
    
    //Arrange
    String status = AppointmentExamples.getInitiatedAppointment();

    //Act
    Color result = AppointmentStatusColorService.getAppointmentStatusColor(status);

    //Assert
    expect(result, colorGreen);

  });


  test('Accepted Status test', ()  {
    
    //Arrange
    String status = AppointmentExamples.getAcceptedAppointment();

    //Act
    Color result = AppointmentStatusColorService.getAppointmentStatusColor(status);

    //Assert
    expect(result, colorGreen);

  });


  test('Scheduled Status test', ()  {
    
    //Arrange
    String status = AppointmentExamples.getScheduledAppointment();

    //Act
    Color result = AppointmentStatusColorService.getAppointmentStatusColor(status);

    //Assert
    expect(result, colorYellow);

  });

  test('Requested Status test', ()  {
    
    //Arrange
    String status = AppointmentExamples.getRequestedAppointment();

    //Act
    Color result = AppointmentStatusColorService.getAppointmentStatusColor(status);

    //Assert
    expect(result, colorYellow);

  });


  test('Rejected Status test', ()  {
    
    //Arrange
    String status = AppointmentExamples.getRejectedAppointment();

    //Act
    Color result = AppointmentStatusColorService.getAppointmentStatusColor(status);

    //Assert
    expect(result, colorError);

  });


  test('Cancelled Status test', ()  {
    
    //Arrange
    String status = AppointmentExamples.getCancelledAppointment();

    //Act
    Color result = AppointmentStatusColorService.getAppointmentStatusColor(status);

    //Assert
    expect(result, colorError);

  });

}