import 'package:flutter_test/flutter_test.dart';
import 'package:my_online_doctor/domain/services/appointment_status_color_service.dart';
import 'package:my_online_doctor/domain/services/calculate_patient_age_domain_service.dart';
import 'package:my_online_doctor/infrastructure/ui/styles/colors.dart';

import '../object_mothers/patient_object_mother.dart';


void main() {
  test('AppointmentStatusColorDomainService test', ()  {
    
    String status = 'COMPLETADA';

    expect(AppointmentStatusColorService.getAppointmentStatusColor(status), colorPrimary);

  });


  test('CalculatePatientAgeDomainService test', ()  {
    
    DateTime patientBirthday = PatientExamples.getPatientBirtDate(20);

    expect(CalculatePatientAgeDomainService.calculatePatientAge(patientBirthday), 20);

  });
}