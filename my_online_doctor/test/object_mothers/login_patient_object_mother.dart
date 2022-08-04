import 'package:my_online_doctor/domain/models/patient/sign_in_patient_domain_model.dart';

class LoginPatientExample {
  static SignInPatientDomainModel loginPatient() {
    return SignInPatientDomainModel(
      email: 'pepe@email.com',
      password: '11111111',
      firebaseToken: 'token',
    );
  }
}
