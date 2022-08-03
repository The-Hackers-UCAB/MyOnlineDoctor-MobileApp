///CalculatePatientAgeDomainService: This service return the age of the patient.
class CalculatePatientAgeDomainService {

 static int calculatePatientAge(DateTime patientBirthday) {

    DateTime today = DateTime.now();
    int actualYear = today.year;
    int birthdayPatientYear = patientBirthday.year;
    int age = actualYear - birthdayPatientYear;

    if (today.month == patientBirthday.month) {
      if (today.day < patientBirthday.day) {
        age = age - 1;
      }
    }

    return age;
  }

}