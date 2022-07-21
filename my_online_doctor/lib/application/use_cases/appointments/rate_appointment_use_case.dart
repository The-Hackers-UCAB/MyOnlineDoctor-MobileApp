//Project import:
import 'package:my_online_doctor/domain/models/appointment/rate_appointment_model.dart';
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/infrastructure/providers/commands/appointment/appointment_command_provider_contract.dart';

enum AppointmentUseCaseError {noAppointmentsFound }


abstract class RateAppointmentsUseCaseContract {
  static inject() => getIt.registerSingleton<RateAppointmentsUseCaseContract>(
      _RateAppointmentsUseCase());

  static RateAppointmentsUseCaseContract get() => getIt<RateAppointmentsUseCaseContract>();

  /// Providers
  AppointmentCommandProviderContract provider = AppointmentCommandProviderContract.inject();

  /// Methods
  Future<dynamic> run(RateAppointmentModel appointment);
}




class _RateAppointmentsUseCase extends RateAppointmentsUseCaseContract {

  @override
  Future<dynamic> run(RateAppointmentModel appointment) async {

    return provider.rateAppointment(appointment);
  }
}


extension _ProviderMapper on AppointmentCommandProviderError {
  AppointmentUseCaseError toUseCaseError() {
    switch (this) {
      default:
        return AppointmentUseCaseError.noAppointmentsFound;
    }
  }
}