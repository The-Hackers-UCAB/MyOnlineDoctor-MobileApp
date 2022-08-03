import 'package:my_online_doctor/domain/models/appointment/get_appointment_model.dart';

class AppointmentExamples {
  static GetAppointmentModel scheduledAppointment() {
    return GetAppointmentModel(
        id: '1',
        date: DateTime.now(),
        description: 'Descripcion',
        duration: 1,
        status: "AGENDADA",
        type: "VIRTUAL",
        patient: Patient(
            id: 'ID',
            firstName: "Paciente",
            firstSurname: "Paciente",
            gender: "MALE",
            status: "ACTIVO"),
        doctor: Doctor(
            id: "1",
            firstName: "Doctor",
            firstSurname: "Doctor",
            gender: "MALE",
            status: "ACTIVO"),
        specialty: Specialty(id: 1, specialty: "CARDIOLOGY"));
  }



  static String getCompletedAppointment() => 'COMPLETADA';

  static String getAcceptedAppointment()  => 'ACEPTADA';

  static String getInitiatedAppointment() => 'INICIADA';

  static String getScheduledAppointment() => 'AGENDADA';

  static String getRejectedAppointment() => 'RECHAZADA';

  static String getCancelledAppointment() => 'CANCELADA';

  static String getRequestedAppointment() => 'SOLICITADA';


}
