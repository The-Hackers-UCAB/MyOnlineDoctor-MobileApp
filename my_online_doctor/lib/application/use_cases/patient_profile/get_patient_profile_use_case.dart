//Project import:
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/infrastructure/providers/queries/patient_profile/patient_profile_query_provider_contract.dart';

enum GetPatientProfileUseCaseError {noPatientFound}


abstract class GetPatientProfileUseCaseContract {
  static inject() => getIt.registerSingleton<GetPatientProfileUseCaseContract>(
      _GetPatientProfileUseCase());

  static GetPatientProfileUseCaseContract get() => getIt<GetPatientProfileUseCaseContract>();

  /// Providers
  PatientProfileQueryProviderContract provider = PatientProfileQueryProviderContract.inject();

  /// Methods
  Future<dynamic> run(); 
}




class _GetPatientProfileUseCase extends GetPatientProfileUseCaseContract {

  @override
  Future<dynamic> run() async {

    return provider.getPatientProfile();
  }
}


extension _ProviderMapper on PatientProfileQueryProviderError {
  GetPatientProfileUseCaseError toUseCaseError() {
    switch (this) {
      default:
        return GetPatientProfileUseCaseError.noPatientFound;
    }
  }
}