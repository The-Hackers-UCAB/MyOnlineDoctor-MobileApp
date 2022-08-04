import 'package:flutter_test/flutter_test.dart';
import 'package:my_online_doctor/domain/services/calculate_patient_age_domain_service.dart';

import '../object_mothers/patient_object_mother.dart';


void main() {
  
  test('Calculate Patient Age Domain Service test', ()  {
    
    //Arrange
    DateTime patientBirthday = PatientExamples.getPatientBirtDate(20);

    //Act
    int result = CalculatePatientAgeDomainService.calculatePatientAge(patientBirthday);

    //Assert
    expect(result, 20);

  });
}