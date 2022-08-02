import 'package:my_online_doctor/infrastructure/core/constants/repository_constants.dart';
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/infrastructure/core/repository_manager.dart';

abstract class PatientProfileQueryProviderContract {
  static PatientProfileQueryProviderContract inject() => _PatientProfileQueryProvider();

  Future<void> getPatientProfile(); //TDOO: add model
}

enum PatientProfileQueryProviderError {
  unauthorized,
  internalError,
}



class _PatientProfileQueryProvider extends PatientProfileQueryProviderContract {

  
  @override
  Future<dynamic> getPatientProfile() async {
    final response = await getIt<RepositoryManager>()
        .request(
          operation: RepositoryConstant.operationPost.key,
          endpoint: RepositoryPathConstant.getPatientProfile.path,
        )
        .catchError((onError) {
      return null;
    });

    return response;
  }

}
