class PatientExamples {

  static DateTime getPatientBirtDate(int years) {
    return DateTime.now().subtract(Duration(days: (365 * years) + 365));
  }


}