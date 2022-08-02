import 'package:my_online_doctor/domain/models/patient/sign_up_patient_domain_model.dart';
import 'package:my_online_doctor/infrastructure/core/constants/repository_constants.dart';
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/infrastructure/core/repository_manager.dart';

abstract class PatientCommandProviderContract {
  static PatientCommandProviderContract inject() => _PatientCommandProvider();

  Future<void> registerPatient(SignUpPatientDomainModel patient);

  Future<void> recoverPatientPassword(); //TDOO: add model

}

enum PatientCommandProviderError {
  unauthorized,
  internalError,
  patientAlreadyRegistered,
}


class _PatientCommandProvider extends PatientCommandProviderContract {

  @override
  Future<dynamic> registerPatient(SignUpPatientDomainModel patient) async {

    final response = await getIt<RepositoryManager>()
    .request(operation: RepositoryConstant.operationPost.key, endpoint: RepositoryPathConstant.register.path, body: patient.toJson())
    .catchError((onError) {

      return null;

    });

    return response;
  }



  @override
  Future<dynamic> recoverPatientPassword() async {

    final response = await getIt<RepositoryManager>()
    .request(operation: RepositoryConstant.operationPost.key, endpoint: RepositoryPathConstant.recoverPatientPassword.path, body: {})
    .catchError((onError) {

      return null;

    });

    return response;
  }



}