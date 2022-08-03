//Project import:
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/infrastructure/providers/commands/patient/patient_command_provider_contract.dart';

enum RecoverPatientPasswordUseCaseError {noPatientFound, incorrectPassword}


abstract class RecoverPatientPasswordUseCaseContract {
  static inject() => getIt.registerSingleton<RecoverPatientPasswordUseCaseContract>(
      _RecoverPatientPasswordUseCase());

  static RecoverPatientPasswordUseCaseContract get() => getIt<RecoverPatientPasswordUseCaseContract>();

  /// Providers
  PatientCommandProviderContract provider = PatientCommandProviderContract.inject();

  /// Methods
  Future<dynamic> run(); //TDOO: add model
}




class _RecoverPatientPasswordUseCase extends RecoverPatientPasswordUseCaseContract {

  @override
  Future<dynamic> run() async {

    return provider.recoverPatientPassword();
  }
}


extension _ProviderMapper on PatientCommandProviderError {
  RecoverPatientPasswordUseCaseError toUseCaseError() {
    switch (this) {
      default:
        return RecoverPatientPasswordUseCaseError.noPatientFound;
    }
  }
}