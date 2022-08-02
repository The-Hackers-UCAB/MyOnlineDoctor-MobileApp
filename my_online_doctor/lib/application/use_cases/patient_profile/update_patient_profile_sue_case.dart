//Project import:
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/infrastructure/providers/commands/patient_profile/patient_profile_command_provider_contract.dart';

enum UpdatePatientProfileUseCaseError {noPatientFound}


abstract class UpdatePatientProfileUseCaseContract {
  static inject() => getIt.registerSingleton<UpdatePatientProfileUseCaseContract>(
      _UpdatePatientProfileUseCase());

  static UpdatePatientProfileUseCaseContract get() => getIt<UpdatePatientProfileUseCaseContract>();

  /// Providers
  PatientProfileCommandProviderContract provider = PatientProfileCommandProviderContract.inject();

  /// Methods
  Future<dynamic> run(); //TDOO: add model
}




class _UpdatePatientProfileUseCase extends UpdatePatientProfileUseCaseContract {

  @override
  Future<dynamic> run() async {

    return provider.updatePatientProfile();
  }
}


extension _ProviderMapper on PatientProfileCommandProviderError {
  UpdatePatientProfileUseCaseError toUseCaseError() {
    switch (this) {
      default:
        return UpdatePatientProfileUseCaseError.noPatientFound;
    }
  }
}