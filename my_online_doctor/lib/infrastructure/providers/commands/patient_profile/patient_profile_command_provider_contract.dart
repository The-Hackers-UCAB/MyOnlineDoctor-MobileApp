import 'package:my_online_doctor/infrastructure/core/constants/repository_constants.dart';
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/infrastructure/core/repository_manager.dart';

abstract class PatientProfileCommandProviderContract {
  static PatientProfileCommandProviderContract inject() => _PatientProfileCommandProvider();

  Future<void> updatePatientProfile(); //TDOO: add model
}

enum PatientProfileCommandProviderError {
  unauthorized,
  internalError,
}



class _PatientProfileCommandProvider extends PatientProfileCommandProviderContract {

  
  @override
  Future<dynamic> updatePatientProfile() async {
    final response = await getIt<RepositoryManager>()
        .request(
          operation: RepositoryConstant.operationPost.key,
          endpoint: RepositoryPathConstant.updatePatientProfile.path,
        )
        .catchError((onError) {
      return null;
    });

    return response;
  }

}
