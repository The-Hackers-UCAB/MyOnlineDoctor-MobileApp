//Project import:
import 'package:my_online_doctor/domain/models/appointment/request_appointment_model.dart';
import 'package:my_online_doctor/infrastructure/core/injection_manager.dart';
import 'package:my_online_doctor/infrastructure/providers/commands/appointment/appointment_command_provider_contract.dart';

enum AppointmentUseCaseError {noAppointmentsFound }


abstract class RequestAppointmentsUseCaseContract {
  static inject() => getIt.registerSingleton<RequestAppointmentsUseCaseContract>(
      _RequestAppointmentsUseCase());

  static RequestAppointmentsUseCaseContract get() => getIt<RequestAppointmentsUseCaseContract>();

  /// Providers
  AppointmentCommandProviderContract provider = AppointmentCommandProviderContract.inject();

  /// Methods
  Future<dynamic> run(RequestAppointmentModel appointment);
}




class _RequestAppointmentsUseCase extends RequestAppointmentsUseCaseContract {

  @override
  Future<dynamic> run(RequestAppointmentModel appointment) async {

    return provider.requestAppointment(appointment);
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