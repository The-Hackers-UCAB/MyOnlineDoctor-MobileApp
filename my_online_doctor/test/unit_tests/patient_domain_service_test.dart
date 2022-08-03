import 'package:flutter_test/flutter_test.dart';
import 'package:my_online_doctor/domain/services/calculate_patient_age_domain_service.dart';

import '../object_mothers/patient_object_mother.dart';


void main() {
  
  test('Calculate Patient Age Domain Service test', ()  {
    
    DateTime patientBirthday = PatientExamples.getPatientBirtDate(20);

    expect(CalculatePatientAgeDomainService.calculatePatientAge(patientBirthday), 20);

  });
}